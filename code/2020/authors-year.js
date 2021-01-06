/* jshint esversion: 8 */
/* Generates list of authors to racket repositories per year 
   - year comes as argument. Example: `node authors-year.js 2020'
*/
(function () {
    'use strict';

    var moment = require('moment');
    
    const interestingRepos = ['racket', 'redex', 'typed-racket', 'drracket', 'scribble', 'plot'];
    
    const { Octokit } = require('@octokit/rest');
    const octokit = new Octokit({
	auth: process.env.GITHUB_TOKEN,
	throttle: {
	    onRateLimit: (retryAfter, options) => {
		octokit.log.warn(`Request quota exhausted for request ${options.method} ${options.url}`);

		if (options.request.retryCount === 0) { // only retries once
		    console.log(`Retrying after ${retryAfter} seconds!`);
		    return true;
		}
	    },
	    onAbuseLimit: (retryAfter, options) => {
		// does not retry, only logs a warning
		octokit.log.warn(`Abuse detected for request ${options.method} ${options.url}`);
	    }
	}
    });
    
    // To count the authors we get all the references for master since beginning of the year
    // and accumulate all the authors. Then we check which ones were author in the range
    // Then print all authors in the range and all authors in the range that were not authors between
    // the beginning of the year and the beginning of the range.
    //
    // Returned data will look like:
    // { /authorlogin/: {
    //           'name': /authorname/,
    //           'commits': [
    //                   { 'repo': /reponame/,
    //                     'sha': /commitsha/,
    //                     'date': /commitdate/ } ...manycommits] } ...manyauthorlogin }
    function countAuthorsSince(repo, yearStr) {
        const yearBegin = moment(`${yearStr}-01-01T00:00:00Z`, 'YYYY-MM-DDTHH:mm:ssZ', true);
        const yearEnd = moment(yearBegin).add(1, 'Y'); // add one year to yearBegin
	const options = octokit.repos.listCommits.endpoint.merge({	
	    owner: 'racket',
	    repo: repo,
	    sha: 'master',
	    since: yearBegin,
            until: yearEnd
	});
	return octokit.paginate(options)
	    .then(commits => {
		let data = [];
		commits.forEach(commit => {
		    const commitStr = JSON.stringify(commit);
		    var key = commit.commit.author.name;
                    if (!key)
                        key = commit.author.login;

                    if (data.indexOf(key) === -1) {
                        data.push(key);
                    }
		});
		return data;
	    });
    }
    
    function printAuthorTable(authors) {
	// Print all authors    
	console.log(`Contributions by (${authors.length}):`);
	authors.sort().forEach(name => console.log(`* ${name}`));
    }

    var myArgs = process.argv.slice(2);
    var yearStr = myArgs[0];
    console.log(`Analyzing repositories for year ${yearStr}`);
    
    function mergeContributions(contribArr) {
        var merged = [].concat.apply([], contribArr);
        return [...new Set(merged)];
    }
    
    /////////////////////////////////////////////////
    //
    // Author Contributions
    //
    ////////////////////////////////////////////////
    var promises = interestingRepos.map(repo => countAuthorsSince(repo, yearStr));
    var contributionsByAuthor = Promise.all(promises).then(vs => mergeContributions(vs)).catch(error => {
	console.log(error.message);
    });

    contributionsByAuthor.then(authors => {
	// Prints authors in date range and new authors since beginning
	printAuthorTable(authors);
    }).catch(error => {
	console.log(error.message);
    });    
}());
