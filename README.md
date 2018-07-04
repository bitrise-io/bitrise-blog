# Bitrise - Blog

## Local develop environment setup

The first step to specify the API tokens in an environment file named `.env`. The two required keys are `BUTTER_TOKEN` and `MAILCHIMP_API_TOKEN`, which have to be declared such as `KEY=VALUE`. When it's done you just have to run `docker-compose up` and the site starts in local on the port 3000.

**BUTTER_TOKEN** you will found in the settings tab after you logged in: `https://buttercms.com/settings/`.

**MAILCHIMP_API_TOKEN** you need to logged in to the `MailChimp` and navigate to the `Account` > `Extras` > `API keys` section.

**MAILCHIMP_LIST_ID** you will need to logged in to the `MailChimp` and go to the Lists and select the `Lists` > `Settings` > `List name and defaults` and you will found there the `List ID` block with you listing ID.

