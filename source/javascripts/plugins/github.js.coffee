class Branding.Plugins.Github extends Branding.Models.Plugin

  initialize: ->
    @fetchData "https://api.github.com/users/#{@get 'user'}/repos", 'github-repos'

  dataLoaded: (data) ->
    # trigger a ready event

  processData: (repositories, key) ->
    repos = @simplifyRepos repositories.data
    sortedRepos = _.sortBy repos, (repo) -> -Date.parse(repo.pushedAt)
    data =
      repositories: sortedRepos
      languages: @extractTechnologies repositories.data

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

Branding.app.on 'application:initialize', (world) ->
  user = $('meta[name=github-user]').attr('content')
  if user?
    world.plugins.add new Branding.Plugins.Github(user: user)

