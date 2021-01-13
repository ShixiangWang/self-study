package cmd

import (
	"log"
	"strconv"
	"strings"
	"time"

	"github.com/ShixiangWang/home/gomod/tour/internal/timer"
	"github.com/spf13/cobra"
)

var calculateTime string
var duration string

var timeCmd = &cobra.Command{
	Use:   "time",
	Short: "Time format processing",
	Long:  "Time format processing",
	Run:   func(cmd *cobra.Command, args []string) {},
}

var nowTimeCmd = &cobra.Command{
	Use:   "now",
	Short: "Get current time",
	Long:  "Get current time",
	Run: func(cmd *cobra.Command, args []string) {
		// timer.GetNowTime()
		nowTime := timer.GetNowTime()
		// log.Println("yeah")
		log.Printf("Output: %s, %d", nowTime.Format("2006-01-02 15:04:05"), nowTime.Unix())
		// log.Println(nowTime.Unix())
	},
}

var calculateTimeCmd = &cobra.Command{
	Use:   "calc",
	Short: "Calculate required time",
	Long:  "Calculate required time",
	Run: func(cmd *cobra.Command, args []string) {
		var currentTimer time.Time
		var laylout = "2006-01-02 15:04:05"

		if calculateTime == "" {
			currentTimer = timer.GetNowTime()
		} else {
			var err error
			if !strings.Contains(calculateTime, " ") {
				laylout = "2006-01-02"
			}
			currentTimer, err = time.Parse(laylout, calculateTime)
			if err != nil {
				t, _ := strconv.Atoi(calculateTime)
				currentTimer = time.Unix(int64(t), 0)
			}
		}
		calculateTime, err := timer.GetCalculateTime(currentTimer, duration)
		if err != nil {
			log.Fatalf("timer.GetCalculateTime error: %v", err)
		}
		log.Printf("Output: %s, %d", calculateTime.Format(laylout), calculateTime.Unix())
	},
}

func init() {
	timeCmd.AddCommand(nowTimeCmd)
	timeCmd.AddCommand(calculateTimeCmd)

	calculateTimeCmd.Flags().StringVarP(&calculateTime, "calculate", "c", "", "time")
	calculateTimeCmd.Flags().StringVarP(&duration, "duration", "d", "", "time duration")
}
