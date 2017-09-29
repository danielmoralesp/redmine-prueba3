module RedmineKnowledgebase
  class Hooks < Redmine::Hook::ViewListener
    def view_issues_show_description_bottom(context = {})
      # the controller parameter is part of the current params object
      # This will render the partial into a string and return it.
      context[:controller].send(:render_to_string, {
        :partial => " redmine_knowledgebase/hooks/view_issues_show_description_bottom",
        :locals => context
      })
      # Instead of the above statement, you could return any string generated
      # by your code. That string will be included into the view
    end
  end
end

module Knowledgebase
     module Hooks
       class ControllerIssuesEditBeforeSaveHook < Redmine::Hook::ViewListener
         def controller_issues_edit_before_save(context={})
           if context[:params] && context[:params][:issue]
             if User.current.allowed_to?(:assign_article_to_issue,
               context[:issue].project)
               if context[:params][:issue][:article_id].present?
                 article = KbArticle.find_by_id(context[:params]
                   [:issue][:article_id])
                   if article.category.project ==
                    context[:issue].project
                    context[:issue].article = article
                  end
                  else
              context[:issue].article = nil
            end
          end
        end
        return ''
      end
    end
  end
end
