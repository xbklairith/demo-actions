workflow "Build/Test" {
  on = "push"
  resolves = [
    "Build-container",
    "Action: npm test",
  ]
}

action "Action: npm install" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "Action: npm test" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "test"
  needs = ["Action: npm install"]
}

action "Build-container" {
  uses = "actions/docker/cli@86ff551d26008267bb89ac11198ba7f1d807b699"
  args = "build -t  demo-actions  ."
}
