# app/controllers/sitepress_controller.rb
class SitepressController < Sitepress::SiteController
  before_action :require_authentication

  # Allow unauthenticated access to the show action (all Sitepress pages)
  # but we'll override this behavior in the show method
  allow_unauthenticated_access only: :show

  def show
    # Make Current.user available on all pages
    resume_session
    # Check if this is a non-public page
    unless public_page?(request.path)
      # If not public and not authenticated, redirect to login
      unless authenticated?
        request_authentication
        return
      end
    end
    # Continue with the original show action
    super
  end

  private

  def public_page?(path)
    # Get the Sitepress page object for this path
    page = site.get(path)
    return false unless page

    # Check if the page has public:true in its frontmatter
    page.data["public"] == true
  end
end
