#!/bin/zsh

# --------------------------------------------------------
# Systemctl Services and Control
# --------------------------------------------------------
alias ctlprocess="sudo systemctl --failed"
alias ctlservices="systemctl list-unit-files --type=service"
alias ctllist="systemctl list-unit-files --type=service"
alias ctlreload="sudo systemctl daemon-reload"
alias ctlenable="sudo systemctl enable"
alias ctlstart="sudo systemctl start"
alias ctlrestart="sudo systemctl restart"
alias ctlstatus="sudo systemctl status"