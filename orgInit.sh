sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx force:package:install --package 04t3k0000027AglAAE -w 20
sfdx force:source:push

# Special perm/license stuff for SustCloud
sfdx shane:user:psl -l User -g User -n sustain_app_SustainabilityCloudPsl
sfdx force:user:permset:assign -n SustainabilityAnalytics
sfdx force:user:permset:assign -n SustainabilityAppAuditor
sfdx force:user:permset:assign -n SustainabilityAppManager
sfdx force:user:permset:assign -n SustainabilityCloud

sfdx automig:load -d data --concise
sfdx force:org:open