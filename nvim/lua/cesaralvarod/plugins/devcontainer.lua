return {
	"esensar/nvim-dev-container",
	lazy = true,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = true,
	cmd = {
		"DevcontainerBuild",
		"DevcontainerImageRun",
		"DevcontainerBuildAndRun",
		"DevcontainerBuildRunAndAttach",
		"DevcontainerComposeUp",
		"DevcontainerComposeDown",
		"DevcontainerComposeRm",
		"DevcontainerStartAuto",
		"DevcontainerStartAutoAndAttach",
		"DevcontainerAttachAuto",
		"DevcontainerStopAuto",
		"DevcontainerStopAll",
		"DevcontainerRemoveAll",
		"DevcontainerLogs",
		"DevcontainerOpenNearestConfig",
		"DevcontainerEditNearestConfig",
	},
}