package cmd

import (
	"log"
	"strings"

	"github.com/spf13/cobra"

	"github.com/ShixiangWang/home/gomod/tour/internal/word"
)

const (
	ModeUpper                      = iota + 1 // 全部转大写
	ModeLower                                 // 全部转小写
	ModeUnderscoreToUpperCamelCase            // 下划线转大写驼峰
	ModeUnderscoreToLowerCamelCase            // 下线线转小写驼峰
	ModeCamelCaseToUnderscore                 // 驼峰转下划线
)

var str string
var mode int8
var desc = strings.Join([]string{
	"Word transformer, mode as the following:",
	"1: all word to upper case",
	"2: all word to lower case",
	"3: underscore case to upper camel case",
	"4: underscore case to lower camel case",
	"5: camel case to underscore case",
}, "\n")

var wordCmd = &cobra.Command{
	Use:   "word",
	Short: "Word transoformer",
	Long:  desc,
	Run: func(cmd *cobra.Command, args []string) {
		var content string
		switch mode {
		case ModeUpper:
			content = word.ToUpper(str)
		case ModeLower:
			content = word.ToLower(str)
		case ModeUnderscoreToUpperCamelCase:
			content = word.UnderscoreToUpperCamelCase(str)
		case ModeUnderscoreToLowerCamelCase:
			content = word.UnderscoreToLowerCamelCase(str)
		case ModeCamelCaseToUnderscore:
			content = word.CamelCaseToUnderscore(str)
		default:
			log.Fatalf("Cannot support such mode, please run help work for details.")
		}

		log.Printf("Print output: %s", content)
	},
}

func init() {
	wordCmd.Flags().StringVarP(&str, "str", "s", "", "Please input word content")
	wordCmd.Flags().Int8VarP(&mode, "mode", "m", 0, "Please input word transform mode")
}
