#!/bin/bash

curl -so wazuh-agent.pkg http://172.16.10.145/wazuh-agent-latest.pkg && launchctl setenv WAZUH_MANAGER '172.16.10.180' WAZUH_REGISTRATION_PASSWORD 'J4clQPJtsqQ41aLfPAGYK&sxbE5R' && installer -pkg ./wazuh-agent.pkg -target /
/Library/Ossec/bin/ossec-control restart
