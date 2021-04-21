## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| kubernetes | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [kubernetes_cron_job](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cron_job) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| command | Command to execute in the container | `any` | n/a | yes |
| concurrency\_policy | The type of job creation, allow, forbid, replace. | `string` | `"Forbid"` | no |
| cron\_name | The name of the cron to be read in the kubernetes cluster | `string` | n/a | yes |
| env\_secret\_name | The secret where there's env vars to put inside the container | `any` | n/a | yes |
| image | Name of the image to use in the object. | `string` | `""` | no |
| namespace | n/a | `string` | n/a | yes |
| parallelism | Specifies the maximum desired number of pods the job should run at any given time. | `number` | n/a | yes |
| schedule | The time when the cron must run. | `string` | n/a | yes |
| serviceaccount | n/a | `string` | n/a | yes |
| starting\_deadline\_seconds | Deadline in seconds for starting the job if it misses scheduled time for any reason. | `string` | `"10"` | no |
| successful\_jobs\_history\_limit | The number of successful finished jobs to retain. | `string` | `"10"` | no |
| variables | The environment variables that you need inside the container. | `any` | n/a | yes |

## Outputs

No output.
