package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func testTemplate(t *testing.T, variant string) {
	t.Parallel()

	terraformDir := fmt.Sprintf("../examples/%s", variant)

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir,
		LockTimeout:  "5m",
	}

	terraformTargetMeshOptions := &terraform.Options{
		TerraformDir: terraformDir,
		Targets: []string{
			"module.mesh",
		},
		LockTimeout: "5m",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformTargetMeshOptions)
	terraform.Apply(t, terraformOptions)

	name := terraform.Output(t, terraformOptions, "name")
	arn := terraform.Output(t, terraformOptions, "arn")

	region := getAWSRegion(t)
	accountID := getAWSAccountID(t)

	expectedName := fmt.Sprintf("example-tf-virtual-router-%s", variant)
	expectedMeshName := expectedName
	expectedARN := fmt.Sprintf("arn:aws:appmesh:%s:%s:mesh/%s/virtualRouter/%s", region, accountID, expectedMeshName, expectedName)

	assert.Equal(t, expectedName, name)
	assert.Equal(t, expectedARN, arn)
}
