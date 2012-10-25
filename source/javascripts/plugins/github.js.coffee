#= require ./plugin

class Branding.Plugins.Github extends Branding.Plugin
  template: JST['github']

  constructor: (user, @$el) ->
    @fetchData "https://api.github.com/users/#{user}/repos", 'github-repos'

  processData: (repositories, key) ->
    repos = @simplifyRepos repositories.data
    sortedRepos = _.sortBy repos, (repo) -> -Date.parse(repo.pushedAt)

    data =
      repositories: sortedRepos
      languages: @extractTechnologies repositories.data

  dataLoaded: (data) ->
    @render data

  render: (data) ->
    @$el.html @template data

  extractTechnologies: (repos) ->
    result = {}
    for repo in repos
      result[repo.language] ?= 0
      result[repo.language] += 1
    result

  simplifyRepos: (repos) ->
    for repo in repos
      {
        name: repo.name
        description: repo.description
        fork: repo.fork
        stars: repo.watchers_count
        pushedAt: repo.pushed_at
      }

$ ->
  user = $('meta[name=github-user]').attr('content')
  new Branding.Plugins.Github(user, $('div.github')) if user?
