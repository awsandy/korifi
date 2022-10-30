cf api --skip-ssl-validation https://api.vcap.me
#Set the CF_ADMIN_PASSWORD environment variable to the CF administrative password, stored in the cf_admin_password key in the configuration-values/deployment-values.yml file:
CF_ADMIN_PASSWORD="$(bosh interpolate ./cf-install-values.yml --path /cf_admin_password)"
cf auth admin "$CF_ADMIN_PASSWORD"
# enable docker
cf enable-feature-flag diego_docker
# A powerful feature provided by CF is multi-tenancy, where you can create a space for a team, an app or whatever your workflow requires.
# Create and target an organization and space.
cf create-org test-org
cf create-space -o test-org test-space
cf target -o test-org -s test-space