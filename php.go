package main

import (
	"fmt"
	"github.com/midoks/GoPHP/internal/cmd"
	"github.com/urfave/cli"
	"os"
)

const Version = "0.0.1-dev"

func init() {

}

func main() {

	app := cli.NewApp()
	app.Name = "PHP"
	app.Version = Version
	app.Usage = "PHP: Hypertext Preprocessor Service"
	app.Commands = []cli.Command{
		cmd.Cli,
	}

	if err := app.Run(os.Args); err != nil {
		fmt.Println("Failed to start application: %v", err)
	}
}
