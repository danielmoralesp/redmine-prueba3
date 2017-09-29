Redmine::Plugin.register :redmine_knowledgebase do
  name        'Knowledgebase'
  author      'Alex Bevilacqua'
  author_url  'http://www.alexbevi.com'
  description 'a knowledgebase plugin for Redmine'
  url         'https://github.com/alexbevi/redmine_knowledgebase'
  version     ' 3.0.0'
  requires_redmine :version_or_higher => '2.0.0'
  settings :default => {
    :sort_category_tree => true,
    :show_category_totals => true,
    :summary_limit => 5,
    :disable_article_summaries => false
    }, :partial => 'settings/knowledgebase_settings'
    project_module :knowledgebase do
      permission :view_articles, {
        :knowledgebase => :index,
        :articles      => [:show, :tagged],
        :categories    => [:index, :show]
      }
      permission :create_articles, {
        :knowledgebase => :index,
        :articles => [:show, :tagged, :new, :create, :preview],
        :categories => [:index, :show]
      }
    # ...
  end
end
