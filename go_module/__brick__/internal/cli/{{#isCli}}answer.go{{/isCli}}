package cli

const (
	proceedShortAnswer = "y"
	proceedLongAnswer  = "yes"
)

var proceedAnswers = []string{proceedShortAnswer, proceedLongAnswer}

func IsProceedAnswer(s []string, e string) bool {
	for _, a := range s {

		if a == e {
			return true
		}
	}

	return false
}
