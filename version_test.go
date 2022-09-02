package main

import (
	"strings"
	"testing"
)

func TestAppVersionIsNotEmpty(t *testing.T) {
	if strings.Trim(APP_VERSION, " ") == "" {
		t.Fail()
	}
}
