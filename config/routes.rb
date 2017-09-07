Rails.application.routes.draw do

  scope :module => 'buttercms' do
    post '/subscribe_user' => 'base#subscribe_user'

    post '/tags/:slug/posts' => 'tags#fetch_posts'
    get '/tags/:slug' => 'tags#show', :as => :buttercms_tag

    post '/posts/list' => 'posts#fetch_posts'
    get '/posts/all' => 'posts#all_posts'
    get '/posts/search' => 'posts#search_post'
    post '/posts/search' => 'posts#search'

    post '/categories/:slug/posts' => 'categories#fetch_posts'
    get '/categories/:slug' => 'categories#show', :as => :buttercms_category

    post '/authors/:slug/posts' => 'authors#fetch_posts'
    get '/author/:slug' => 'authors#show', :as => :buttercms_author

    get '/rss' => 'feeds#rss', :format => 'rss', :as => :buttercms_blog_rss
    get '/atom' => 'feeds#atom', :format => 'atom', :as => :buttercms_blog_atom
    get '/sitemap.xml' => 'feeds#sitemap', :format => 'xml', :as => :buttercms_blog_sitemap

    # Redirects
    get '/2017/09/04/august-highlights.html', to: redirect('/august-highlights')
    get '/2017/09/01/travelex-improved-continuous-integration-with-bitrise.html', to: redirect('/travelex-improved-continuous-integration-with-bitrise')
    get '/2017/08/31/we-support-xcode-9-s-new-exportoptions-property.html', to: redirect('/we-support-xcode-9-s-new-exportoptions-property')
    get '/2017/08/25/set-your-build-version-on-bitrise-automatically.html', to: redirect('/set-your-build-version-on-bitrise-automatically')
    get '/2017/08/23/install-missing-android-sdk-components-step-for-react-native.html', to: redirect('/install-missing-android-sdk-components-step-for-react-native')
    get '/2017/08/22/registering-new-ios-devices.html', to: redirect('/registering-ios-devices')
    get '/2017/08/18/slack-away.html', to: redirect('/slack-away')
    get '/2017/08/16/one-ios-app-multiple-configurations.html', to: redirect('/one-ios-app-multiple-configurations')
    get '/2017/08/15/new-export-options-plist-in-Xcode-9.html', to: redirect('/new-export-options-plist-in-xcode-9')
    get '/2017/08/11/build-different-release-signed-ipas-for-your-xamarin-ios-project.html', to: redirect('/build-different-release-signed-ipas-for-your-xamarinios-project')
    get '/2017/08/10/unity-for-the-win-on-bitrise-too.html', to: redirect('/unity-for-the-win-on-bitrise-too')
    get '/2017/08/07/droids-on-roids-how-to-connect-physical-devices-to-bitrise-io.html', to: redirect('/droids-on-roids-how-to-connect-physical-devices-to-bitriseio')
    get '/2017/08/04/4-things-to-remember-when-upgrading-a-production-virtual-machine.html', to: redirect('/4-things-to-remember-when-upgrading-a-production-virtual-machine')
    get '/2017/08/02/july-highlights.html', to: redirect('/july-highlights')
    get '/2017/08/01/bitrise-raises-3-2-million-in-series-a-funding.html', to: redirect('/bitrise-raises-32-million-in-series-a-funding')
    get '/2017/07/28/danger-danger-uh-that-is-using-danger-with-bitrise.html', to: redirect('/danger-danger-uh-that-is-using-danger-with-bitrise')
    get '/2017/07/27/introducing-full-cross-platform-support.html', to: redirect('/introducing-full-cross-platform-support')
    get '/2017/07/25/how-to-set-up-a-react-native-app-on-bitrise.html', to: redirect('/how-to-set-up-a-react-native-app-on-bitrise')
    get '/2017/07/20/ifttt-bitrise-magic.html', to: redirect('/lets-automate-together-bitrise-ifttt')
    get '/2017/07/17/yoyo-wallet-shipping-fast-and-frequently-with-bitrise.html', to: redirect('/yoyo-wallet-shipping-fast-and-frequently-with-bitrise')
    get '/2017/07/14/extra-minutes-on-hobby-plan.html', to: redirect('/extra-minutes-on-hobby-plan')
    get '/2017/01/27/state-of-app-development-in-2016.html', to: redirect('/state-of-app-development-2016')
    get '/2017/01/14/weekly-virtual-machine-stack-updates-now-on-discuss-bitrise-io.html', to: redirect('/weekly-vritual-machine-stack-updates-now-on-discuss')
    get '/2016/12/12/the-new-devcenter-finally-arrived.html', to: redirect('/the-new-devcenter-has-finally-arrived')
    get '/2016/10/31/xcode-8-1-final-on-macos-sierra.html', to: redirect('/xcode-8-1-final-on-macos-sierra')
    get '/2016/10/18/gifs-make-everything-better.html', to: redirect('/gifs-make-everything-better')
    get '/2016/10/15/trigger-builds-with-git-tags.html', to: redirect('/trigger-builds-with-git-tags')
    get '/2016/10/12/disable-and-trigger-scheduled-builds-on-demand.html', to: redirect('/disable-and-trigger-scheduled-builds-on-demand')
    get '/2016/10/06/bitbucket-pull-request-support-is-here.html', to: redirect('/bitbucket-pull-request-support-is-here')
    get '/2016/09/23/do-more-with-triggers.html', to: redirect('/do-more-with-triggers')
    get '/2016/09/21/xcode-8-and-automatic-code-signing.html', to: redirect('/xcode-8-and-automatic-code-signing')
    get '/2016/09/17/cocoapods-issue-and-fix-with-xcode-8.html', to: redirect('/cocoapods-issue-and-fix-with-xcode-8')
    get '/2016/09/06/new-tutorial-configuring-and-using-vpn.html', to: redirect('/new-tutorial-configuring-and-using-vpn')
    get '/2016/08/30/manage-your-dev-team-like-a-boss-through-the-all-new-organizations.html', to: redirect('/manage-your-dev-team-like-a-boss-through-the-all-new-organizations')
    get '/2016/08/25/new-team-handling-features.html', to: redirect('/new-team-handling-features')
    get '/2016/08/23/end-of-summer-tweaks.html', to: redirect('/end-of-summer-tweaks')
    get '/2016/08/19/android-could-not-find-appcompat-v7-how-to-update-preinstalled-packages.html', to: redirect('/android-could-not-find-appcompat-v7-how-to-update-preinstalled-packages')
    get '/2016/08/17/new-gradle-runner-version-gradlew-path-is-now-required.html', to: redirect('/new-gradle-runner-version-gradlew-path-is-now-required')
    get '/2016/06/23/slack-webhook-specify-custom-environment-variables.html', to: redirect('/trigger-a-build-from-slack-now-with-custom-environment-variables')
    get '/2016/06/07/automatic-ios-wildcard-development-code-signing-files.html', to: redirect('/automatic-ios-wildcard-development-code-signing-files')
    get '/2016/06/06/ios-code-signing-a-new-method.html', to: redirect('/ios-code-signing-a-new-method')
    get '/2016/05/13/pretty-little-updates.html', to: redirect('/pretty-little-updates')
    get '/2016/04/29/hooking-up-a-middleman-project-to-deploy-a-static-site-to-heroku-with-bitrise.html', to: redirect('/hooking-up-a-middleman-project-to-deploy-a-static-site-to-heroku-with-bitrise')
    get '/2016/03/22/xamarin-ci-with-bitrise-tutorial-part-3-deploy.html', to: redirect('/xamarin-ci-with-bitrise-tutorial-part-3-deploy')
    get '/2016/03/05/xamarin-ci-with-bitrise-tutorial-part-2-testing.html', to: redirect('/xamarin-ci-with-bitrise-tutorial-part-2-testing')
    get '/2016/02/29/xamarin-ci-with-bitrise-tutorial-part-1-getting-started.html', to: redirect('/xamarin-ci-with-bitrise-tutorial-part-1-getting-started')
    get '/2016/02/23/all-the-webhooks-you-need.html', to: redirect('/all-the-webhooks-you-need')
    get '/2016/02/12/edit-your-yaml-files-like-a-boss.html', to: redirect('/edit-your-yaml-files-like-a-boss')
    get '/2016/02/11/xamarin-users-rejoice.html', to: redirect('/xamarin-users-rejoice')
    get '/2016/02/08/a-better-pricing-for-you.html', to: redirect('/a-better-pricing-for-you')
    get '/2016/02/04/let-s-move-to-the-new-stack.html', to: redirect('/lets-move-to-the-new-stack')
    get '/2016/01/20/here-comes-the-new-stack.html', to: redirect('/here-comes-the-new-stack')
    get '/2016/01/11/the-new-year-together.html', to: redirect('/the-new-year-together')
    get '/2015/11/23/finally-build-your-android-projects-on-bitrise.html', to: redirect('/finally-build-your-android-projects-on-bitrise')
    get '/2015/11/05/schedule-those-builds.html', to: redirect('/build-notification-emails-are-cooler-than-ever')
    get '/2015/11/05/schedule-those-builds.html', to: redirect('/schedule-those-builds')
    get '/2015/10/28/updated-build-logs-with-new-shiny-practical-features.html', to: redirect('/updated-build-logs-with-shiny-practical-features')
    get '/2015/10/19/booyah-our-command-line-interface-just-got-its-own-landing-page.html', to: redirect('/booyah-our-command-line-interface-just-got-its-own-landing-page')
    get '/2015/08/05/introducing-fastlane-on-bitrise.html', to: redirect('/introducing-fastlane-on-bitrise')
    get '/2015/06/24/a-tech-startup-in-london.html', to: redirect('/a-tech-startup-in-london')
    get '/2015/04/29/you-can-now-transfer-the-ownership-of-your-apps.html', to: redirect('/you-can-now-transfer-the-ownership-of-your-apps')
    get '/2015/04/28/announcing-status-images.html', to: redirect('/announcing-status-images')
    get '/2015/04/23/pull-request-support-for-github-repositories.html', to: redirect('/pull-request-support-for-github-repositories')
    get '/2015/01/29/the-new-workflow-system.html', to: redirect('/the-new-workflow-system')
    get '/2014/11/24/we-re-back-from-how-to-web.html', to: redirect('/were-back-from-how-to-web')
    get '/2014/10/29/bitrise-is-one-of-this-year-s-startup-spotlight-finalists.html', to: redirect('/bitrise-is-one-of-this-years-how-to-web-startup-spotlight-finalists')
    get '/2014/07/14/renaming.html', to: redirect('/renaming')

    get '(/page/:page)' => 'posts#index', :defaults => {:page => 1}, :as => :buttercms_blog
    get '/:slug' => 'posts#show', :as => :buttercms_post
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
