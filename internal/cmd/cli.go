package cmd

import (
	"fmt"
	"github.com/urfave/cli"
)

var Cli = cli.Command{
	Name:        "cli",
	Usage:       "This command Check domain configuration",
	Description: `check domain configuration`,
	Action:      doCli,
	Flags: []cli.Flag{
		stringFlag("config, c", "", "Custom configuration file path"),
	},
}

func doCli(c *cli.Context) error {
	fmt.Println("dd")
	return nil
}
