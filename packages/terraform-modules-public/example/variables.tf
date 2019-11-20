# Provide the next vars with a vars-file or modifying the default value
variable google {
  description = "The GCP Data"
  type        = map(string)

  default = {
    project = "canvas-genius-12345"
    region  = "us-west1"
    zone    = "us-west1-a"
  }
}

variable network_name {
  description = "The name of the new VPC network created"
  type        = string

  default = "celo-network"
}

variable celo_env {
  description = "The celo network to connect with"
  type        = string

  default = "baklava"
}

variable replicas {
  description = "The replica number for each component"
  type        = map(number)

  default = {
    validator = 1 # Also used for proxy
    txnode    = 0
  }
}

variable deploy_txnode_loadbalancer {
  description = "Deploy the Load Balancer for Transmission nodes (if txnode > 0)"
  type        = bool

  default = false
}

variable deploy_attestation_service {
  description = "Deploy the Load Balancer for Transmission nodes (if txnode > 0)"
  type        = bool

  default = true
}

variable attestation_service_db {
  description = "Configuration for the Postgres Cloud SQL DB"
  type        = map(string)

  default = {
    username = "celo"
    password = "mysecret"
  }
}

variable proxy_accounts {
  description = "The account data for the proxy nodes"
  type        = map

  default = {
    account_addresses = [
      "0xb9",
      "0x2a",
      "0x4e",
    ]
    private_keys = [
      "07b",
      "95d",
      "432",
    ]
    account_passwords = [
      "secret1",
      "secret2",
      "secret3",
    ]
    private_node_keys = [
      "55",
      "ce",
      "dc",
    ]
    enodes = [
      "55",
      "e0",
      "1a",
    ]
  }
}

variable validator_accounts {
  description = "The account data for the validator nodes"
  type        = map

  default = {
    account_addresses = [
      "0x49",
      "0xd0",
      "0xB6",
    ]
    private_keys = [
      "e6f",
      "d9c",
      "9f3",
    ]
    account_passwords = [
      "secret1",
      "secret2",
      "secret3",
    ]
  }
}

variable txnode_accounts {
  description = "The account data for the validator nodes"
  type        = map

  default = {
    account_addresses = [
      "0x47",
      "0x40",
      "0x84",
    ]
    private_keys = [
      "a57",
      "987",
      "76b",
    ]
    account_passwords = [
      "secret1",
      "secret2",
      "secret3",
    ]
  }
}

# Attestation variables
variable deploy_attestation_service {
  description = "Deploy the Load Balancer for Transmission nodes (if txnode > 0)"
  type        = bool

  default = true
}

variable attestation_service_db {
  description = "Configuration for the Postgres Cloud SQL DB"
  type = map(string)

  default = {
    username = "celo"
    password = "mysecret"
  }
}

variable attestation_service_docker_image {
  description = "The attestation_service docker image"
  type = map(string)

  default = {
    repository = "us.gcr.io/celo-testnet/celo-monorepo"
    tag = "attestation-service-8deb4b1645a6e07f8abfd63281afce778d79e67e"
  }
}

variable attestation_service_attestation_key {
  description = "Etherbase address and private key to sign the attestations"
  type = map(string)
  
  default = {
    address = "0x7a17Cf58E90D470d39ed9E8A81c55711909d8177"
    private_key = "97ff01684627ebb0b23d39f56733b3ad732f18254403b8ba9e23b7e663e95a56"
  }
}

# SMS provider configuration
variable attestation_service_credentials {
  description = "Provider with the credentials for the SMS provider. Provider must be nexmo or twilio"
  type = map(string)

  default = {
    sms_providers = "nexmo"
    nexmo_key = "a..."
    nexmo_secret = "o..."
    nexmo_blacklist = ""
    twilio_account_sid = ""
    twilio_messaging_service_sid = ""
    twilio_auth_token = ""
    twilio_blacklist = ""
  }
}

# Customization parameters
variable geth_verbosity {
  description = "Geth log level"
  type        = number
  default     = 3
}

# The next variables have a default value are not intended to be changed if you do not have a reason for it
variable verification_pool_url {
  description = ""
  type        = string
  default     = "https://us-central1-celo-testnet-production.cloudfunctions.net/handleVerificationRequestalfajores/v0.1/sms/"
}

variable ethstats_host {
  description = "Ethstats host to report data"
  type        = string
  default     = "https://baklava-ethstats.celo-testnet.org"
}

variable in_memory_discovery_table {
  description = "Geth parameter"
  type        = bool
  default     = false
}

variable geth_node_docker_image_repository {
  description = "The Celo Blockchain docker image repository"
  type        = string
  default     = "us.gcr.io/celo-testnet/geth"
}

variable geth_node_docker_image_tag {
  description = "The Celo Blockchain docker image tag"
  type        = string
  default     = "80357538528d3b3f233ff6984b38138714da2c26"
}

variable network_id {
  description = "The ethereum network ID"
  type        = number
  default     = 1101
}

variable block_time {
  description = "The ethereum network block time"
  type        = number
  default     = 1000
}

variable istanbul_request_timeout_ms {
  description = "The ethereum request timeout"
  type        = number
  default     = 10000
}

variable geth_exporter_docker_image_repository {
  description = "The geth exporter docker image repository (for metrics)"
  type        = string
  default     = "jcortejoso/ge"
}

variable geth_exporter_docker_image_tag {
  description = "The geth exporter docker image tag (for metrics)"
  type        = string
  default     = "test"
}

variable bootnode {
  description = "The bootnode connection details"
  type        = map(string)

  default = {
    ip    = "1.2.3.4"
    enode = "1182aa8c9dbb96cd1aa71b74e2b6b481085971e08b210bab3b64c39d54876d4b1370f3f2c3cc3c0f52806a0e5772aa3fe937b4ceda8b97c5bf647a34170555e4"
  }
}

variable static_nodes {
  description = "The static-nodes.json with base64 encoding"
  type        = string
  default     = "WyJlbm9kZTovLzI3MmZkMTBlOGFmYzhlYWY1MWRlMTVjNmZlNWY1NjNmZmUzOTRiZDNkNDQzNjBjZjViNGNjNzNkZDljOTMwNDEyYmRlZTA3YmY5NjllODI0N2M1M2NmMDgxMzM4YmExNWYzYWU0ODIyYjNmNzA4NzUxYTU5NDBlOTBhMDhjZTk0QDM1LjIzMC40MS4xODk6MzAzMDMiLCJlbm9kZTovLzE0MzA0N2RjYThkNjU3ZDA0M2NmM2JhMWVjMTkxODE2MGZmZjE5MWFhOWEzYTdmZDI5ZDM1ODg1NThmODFmM2JkNjhmMmI4OTU3MWEwNzljYzA3ZDNkMjI0MzMyYjEzZWIwOGNmZDQ1YjFlMzRhNTIwMTg0YjRlYjk0Y2I0YzBmQDM1LjIyNy4xODEuNjg6MzAzMDMiXQ=="
}

variable genesis {
  description = "The genesis.json with base64 encoding"
  type        = string
  default     = "eyJjb25maWciOnsiaG9tZXN0ZWFkQmxvY2siOjAsImVpcDE1MEJsb2NrIjowLCJlaXAxNTBIYXNoIjoiMHgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIiwiZWlwMTU1QmxvY2siOjAsImVpcDE1OEJsb2NrIjowLCJieXphbnRpdW1CbG9jayI6MCwiY29uc3RhbnRpbm9wbGVCbG9jayI6MCwicGV0ZXJzYnVyZ0Jsb2NrIjowLCJjaGFpbklkIjoxMTAxLCJpc3RhbmJ1bCI6eyJwb2xpY3kiOjAsInBlcmlvZCI6MywicmVxdWVzdHRpbWVvdXQiOjMwMDAsImVwb2NoIjoxMDAwfX0sIm5vbmNlIjoiMHgwIiwidGltZXN0YW1wIjoiMHg1Yjg0MzUxMSIsImdhc0xpbWl0IjoiMHg4MDAwMDAwIiwiZXh0cmFEYXRhIjoiMHgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwZjkwNzA1ZjkwMWE0OTQ0N2UxNzJmNmNmYjZjN2QwMWMxNTc0ZmEzZTJiZTdjYzczMjY5ZDk1OTRhMGFmMmU3MWNlY2MyNDhmNGE3ZmQ2MDZmMjAzNDY3YjUwMGRkNTNiOTRhNDJjOWIwZDFhMzA3MjJhZWE4YjgxZTcyOTU3MTM0ODk3ZTdhMTFhOTQ4NDg5MjBiMTQxNTRiNjUwOGI4ZDk4ZTdlZTgxNTlhYTg0YjU3OWE0OTQyZmZlOTcwMjU3ZDkzZWFlOWQ2YjEzNGY1MjhiOTNiMjYyYzMxMDMwOTRmZGI4ZGE5MmMzNTk3ZTgxYzI3MzdlOGJlNzkzYmVlOWYxMTcyMDQ1OTQ0MjczOWNmODIyZGMxY2EzNDNjMjBmMzZiMjA1NzhkMDFiNzNmN2QxOTQ0MWE4NjUyNjlmNTE4MmVhNjliZmIwY2ZhMWU4NDExYzgyYWRlOTQxOTQwMDc4M2Y5Mzc1Zjg4NzZhNzdhNDliNDk1NjA4NTc0Y2I4MDAwZDU0OTRlNmU1M2I1ZmMyZTE4ZjUxNzgxZjE0YTNjZTVlN2ZkNDY4MjQ3YTE1OTRkNWVkZTQ2YjQxZWIwNWJiYjZlODViZDU0NTZhYzI3NjllMWMyZjI2OTQ4MDI3NzliZGNjZjA0MzcxYTFhYjUzNDAxZWFhMGMzOWM2NTgxMGRhOTQ0NWJjZGU4NzA1MGMwMzQyZGEwYmI4ZTk1M2IwODdjNDI0ZjNmNzdjOTQxYmIxMWRmYjVjZWU5ZWE1N2Y4ZTI5MzMyMGFjMzBkMmIxNzYyMmYwOTQ0OTRjZWI2ZjI1OTM4MDY4YzQzYzdjYjE3ZjFiYmI2OWVjMmU3NGNjOTQ4MjU4MDJjMzM4MTEyOGE0NmU3NDgzZjgxZmMwNzM5YjQ4NDY4ZGIzOTQ1MTIzYmQ3MDBiZTZmNjk5MGY3YmJiOGM0MzVlZjE5MGQxYjVhOTUwOTRlMTI1YmQ3Mzk5ODkxNmU3NjkyMGNlNjI0ODAyOWU0ZDJiZmZhOWNlOTQ1ZThlYWNkYmJiODQ3OGYzOGExZWFmNmEyNjMxYTNkMjZiY2IyMDY5OTQxYTY0YWVmNDIxYzQ2YzI2ZTA3ZDI4ZmZjMDY1NTVhNWMzYzk2MDZiZjkwM2Q0YjAyNTcxNGIxNTYwYTYwNmQwYTA1ZWEzNGM3NjNjN2U0OWNmYjc2ZGIyNGNkMTZlOGM5Yzk1ZTRjYmY3NTFmOGY1NzMzODMxZTBmNDU2NWFiMjQ5MDVkODM1YTc3NjNkMDBiMDBkOTNjZDUxMTkyN2FiNTM0YTk0NmYwZjkzNDYyNzJlYmQwMGUxODlhOGEwMWNmMTFkM2U5ZWRiNjJhYWE2YTRlYWY0OTE0ZmVlMDY0ZWFkZWMzNzFkOTFlMmViMjA4MGIwNjQ4OWQyZDNiMjA4OWYwMzI2MTQyZjYyYzIxYmRjZmUxNzVmMjM3ZDQ1ZmUyYmI2YWFkNzU0MjQyN2Q5MzM3ZTIzZGQ1NmU5ODY0YzBiZWM5ZTI3ZjYxMDM4MTYxYjAwYjBmNjI5YTJiMmI4MTRiNjhmYmYzZjQ1MmJhYmViYTczYzQxNWZmZTIxNmYyZjA3MmE5Zjk1ZDUxZGQ2ZTg1ZDk1NWQxOTA2MDc0YzA2ZmM0MjQ2Yzc3YjRmOTg0MzIxMDFiMGE5MGUzZjcwNmYzODYxZmRlN2U4NTgyODcyZDVhNjBmNTA0M2Y5NTQ5NTY0ZmFmZDU5ZjdjZTc1NTU3OTBjMTg1MGE4MjFiMjEzYjI5Mzc5NGQ5NDNlNGI5YTg5YWQwMGIwYjJiYjdjZGYwYTdjZWE0MTI3OTBmMjY0YWQwZmUyODQ4NTMyMzE0MzdiYmE1MzUxZjhlOGIzYTE4MzQ4NGVkMmFhMTU4Nzk2MmU1ZjAwYTk5MjRhMmNkZTgwNjhiZjgwYjBiZWZjYTRjMGI0MWI4OGM0ZTMxMWFiZWQ4ZjAxZDEwNDBkZDMwOGI4YzU1MDFkNjU5Y2Y5NTlmZjU1ZGYzMDE3ZDU1N2ZkOTRjZmM1OTc3OGE0YjIzZmM3OGVjNTVmMDFiMDRmMjExOTUyZGY1ZDRmODMxMTZmOGM1MzM1NjRiZDFlNGI5YjFkM2FlMTE3MzI3MTk3MTEzOWY5ODU2ZWZhNWRkZGI0NGFmMmRiMWJhMmU5NzdhNGU1Nzc3ZTEyZmMwMGIwZTIzZjgxN2E4MDcyNTkxNDk4MDYzNTdlMmEwZTEzM2M5MDgxZjBlMTZiOWFiNWFlNDQ4ZmQ4ODIyNmU5NjIxMDJkZTcxYTFkNmRlZjZkYmY3OWI1NTc1ZDY1YTU1ZDgxYjA4YjUxOTdhZWI5Y2FkOTBiZWU5NzVjZWQwNzdjY2VkYzZiMTQ5ZjUwMWQ4YTIwZWU3ZmRlNmZlNmYyYjFhOWNjNGY2YTQwMjgwMzVmZjI3N2EzMDg5YTFkNGE3MjY4MDFiMGM0YmQ0NWI2N2UxMWFjNTRjZWY2Mzk4ZjAxMTc0MDQxZWE4YjAzNzQwMWVkMzY1MjAxYWIxNjY0NGRjNjk2NTBlMjdkNzY3NjBhOTM5MzRlM2Q4NDkyNzE4N2Y0ZjAwMGIwM2Q0MGQ3NGY0OTVkOWY4OGYxZDA2OWI2ZTI5ZjljZGMzODllNWNmMTBmODJkYWE2OTQ2MDAwYTEyODQwN2E1Yzk2NDcyNWU5ZWEyYjVlNTQ2ZGQ2MGQ4M2IxNzEzNjAxYjBiZTY1OWU4OTRkZWJkYzM5OTA4MjFkZTNmZDM5MTdmMWJiMDZhYTc0Njk2NmQ5MTEyNDIxNDYzY2ZhNWJiNWIwMmMzMGZjYThiODZmYjA1OTNmNTI4ZjczYWYxNDMzODFiMDgxMTg4MWM1ZDA4Yzk0MWNmYzkwZDA2MWI1ODY1YzgzMDZjNzZkYjU0MWM3Y2E1YTM0ZjZmOWUyOTRmMTFlM2ZmMTNkNmNjMDEyZTBmZWZmMDdiNzYyZTA4YzE4OGQ4MGIwOWM5MGQzYTk5ZDAwNWYzODlhMWZjMjJjYTIyOWY4NGIwYzc1NjM5MjFhZjQxNmVmNTcyNjdmNjM4ZTYyYzI2YTZiZTAzYzM2YWUyY2JjMzg1MDhiZWQwNzBhMTNhMzgxYjBlYjhkZDQ2NTFmMzE2ZjRiZmY2MmZiYTIxM2EzYjU3N2U5Yjc2NzU0ZGFkMjlmYzhhMGNlY2ZjN2QxZmRhOWE3ZmNkOGE5ZmUzY2U4MDQ4YTE3YWYyMzgyOTI0ZjlhMDFiMDJhODcwNWRkYTg4ZDlmOWE0ZmMzMmY3MDc0ZGRkY2I5ZWIzZTY3MWE3NDI5NDJkNjAzNTUwMmQyYmU0MzgwNjRjZGNlZGNjNTkzYzExODk1NjZkZjE0NmI5MzZjYmQwMGIwY2M1OTRlODFiYjdkODRmNjZkMTU5NzlhZmQ2NzIwZTI3OTg3Y2Q0YTVmNjdkMjEyMTcwYjFiNjIwNzBhZDRjMGMxYjU1NDc5ZmMyN2Q4YmNiYTcwZDUzOTk4M2E4MjAxYjAxOTY3MTljZmE0MWQyMTMyODQ4NGE4MzUxOTA2YzkxNjJmOTE2MDgxNTkxNjM3NzliNDFlNjM1ODg4NjRkYmIxOTY1Njc4MTdkNTlhNWM2OGI5ZDZkZjQ1NjhlNDI1ODFiMGQxNTJlNGI5ZDczZTM4MmFiZjRjMDdjNWE0NTRhNjFkNDBjOGNjZDYwZTY3NzNkMDE3ZDlkYjQxMDA0NWI4MzM2NWE5ODM0NzE5NzNhMjY1OWFiYTlmNzU2NTBmOTEwMTgwYjhjMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDgwYjhjMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDgwIiwiZGlmZmljdWx0eSI6IjB4MSIsImNvaW5iYXNlIjoiMHgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIiwiYWxsb2MiOnsiNDdlMTcyRjZDZkI2YzdEMDFDMTU3NGZhM0UyQmU3Q0M3MzI2OUQ5NSI6eyJiYWxhbmNlIjoiMTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCJ9LCJhMEFmMkU3MWNFQ2MyNDhmNGE3ZkQ2MDZGMjAzNDY3QjUwMERkNTNCIjp7ImJhbGFuY2UiOiIxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIn0sIkE0MmM5YjBkMUEzMDcyMkFFYThiODFFNzI5NTcxMzQ4OTdFN0ExMWEiOnsiYmFsYW5jZSI6IjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAifSwiODQ4OTIwQjE0MTU0YjY1MDhCOGQ5OGU3ZUU4MTU5QUE4NGI1NzlBNCI6eyJiYWxhbmNlIjoiMTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCJ9LCIyZmZlOTcwMjU3RDkzZWFlOWQ2QjEzNGY1MjhiOTNiMjYyQzMxMDMwIjp7ImJhbGFuY2UiOiIxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIn0sImZEQjhEYTkyYzM1OTdlODFDMjczN2U4QkU3OTNCRUU5RjExNzIwNDUiOnsiYmFsYW5jZSI6IjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAifSwiNDI3MzlDRjgyMkRDMWNhMzQzYzIwRjM2QjIwNTc4RDAxQjczZjdEMSI6eyJiYWxhbmNlIjoiMTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCJ9LCI0MWE4NjUyNjlGNTE4MkVhNjliRmIwY0ZhMUU4NDExQzgyYURFOTQxIjp7ImJhbGFuY2UiOiIxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIn0sIjAwNzgzZjkzNzVGODg3NkE3N0E0OWI0OTU2MDg1NzRDQjgwMDBENTQiOnsiYmFsYW5jZSI6IjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAifSwiRTZlNTNiNWZjMmUxOEY1MTc4MWYxNGEzY2U1RTdGRDQ2ODI0N2ExNSI6eyJiYWxhbmNlIjoiMTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCJ9LCJkNWVkZTQ2YjQxRWIwNWJCQjZlODVCRDU0NTZBYzI3NjlFMUMyZjI2Ijp7ImJhbGFuY2UiOiIxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIn0sIjgwMjc3OWJkY2NmMDQzNzFhMWFCNTM0MDFlQUEwYzM5YzY1ODEwZEEiOnsiYmFsYW5jZSI6IjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAifSwiNDVCQ0RFODcwNTBjMDM0MmRhMGJCOEU5NTNiMDg3QzQyNGYzRjc3QyI6eyJiYWxhbmNlIjoiMTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCJ9LCIxQkIxMWRGQjVDRUU5RWE1N0Y4ZTI5MzMyMGFjMzBkMmIxNzYyMkYwIjp7ImJhbGFuY2UiOiIxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIn0sIjQ5NENlYjZmMjU5MzgwNjhjNDNDN2NCMTdGMUJiYjY5RUMyRTc0Y2MiOnsiYmFsYW5jZSI6IjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAifSwiODI1ODAyQzMzODExMjhhNDZFNzQ4M0Y4MUZDMDczOUI0ODQ2OGRCMyI6eyJiYWxhbmNlIjoiMTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCJ9LCI1MTIzQmQ3MDBCRTZmNjk5MGY3QkJiOEM0MzVFZjE5MGQxYjVhOTUwIjp7ImJhbGFuY2UiOiIxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIn0sImUxMjVCRDczOTk4OTE2RTc2OTIwY2U2MjQ4MDI5ZTREMkJGRkE5Q0UiOnsiYmFsYW5jZSI6IjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAifSwiNUU4ZUFDRGJCYjg0NzhGMzhhMUVhZjZBMjYzMUEzZDI2YmNiMjA2OSI6eyJiYWxhbmNlIjoiMTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCJ9LCIxQTY0YUVmNDIxQzQ2YzI2RTA3RDI4ZmZDMDY1NTVBNUMzYzk2MDZCIjp7ImJhbGFuY2UiOiIxMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwIn0sIjIyOTM3RTJjNTA1Mzc0Q2U3QWFFOTU5OTNmZTc1ODBjNTI2YTYyYjQiOnsiYmFsYW5jZSI6IjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAifSwiMUU1QjlBZDA1NTk2NEQ5ODYwODFhNzljNWJDNzAyMEMwNkZjOTYxRiI6eyJiYWxhbmNlIjoiMTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCJ9LCIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDBjZTEwIjp7ImNvZGUiOiIweDYwODA2MDQwNTI2MDA0MzYxMDYxMDA0YTU3NjAwMDM1NjBlMDFjODA2MzAzMzg2YmEzMTQ2MTAwYmM1NzgwNjM0MjQwNGUwNzE0NjEwMTU1NTc4MDYzYmI5MTNmNDExNDYxMDFhYzU3ODA2M2QyOWQ0NGVlMTQ2MTAxZmQ1NzgwNjNmN2U2YWY4MDE0NjEwMjRlNTc1YjYwMDA2MDQwNTE4MDgwN2Y2ZjcyNjcyZTYzNjU2YzZmMmU2OTZkNzA2YzY1NmQ2NTZlNzQ2MTc0Njk2ZjZlMDAwMDAwMDAwMDAwMDAwMDAwODE1MjUwNjAxNzAxOTA1MDYwNDA1MTgwOTEwMzkwMjA5MDUwODA1NDYwNDA1MTM2ODEwMTYwNDA1MjM2NjAwMDgyMzc2MDAwODAzNjgzODU1YWY0M2Q2MDQwNTE4MTgxMDE2MDQwNTI4MTYwMDA4MjNlODI2MDAwODExNDYxMDBiODU3ODI4MmYzNWI4MjgyZmQ1YjYxMDE1MzYwMDQ4MDM2MDM2MDQwODExMDE1NjEwMGQyNTc2MDAwODBmZDViODEwMTkwODA4MDM1NzNmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmMTY5MDYwMjAwMTkwOTI5MTkwODAzNTkwNjAyMDAxOTA2NDAxMDAwMDAwMDA4MTExMTU2MTAxMGY1NzYwMDA4MGZkNWI4MjAxODM2MDIwODIwMTExMTU2MTAxMjE1NzYwMDA4MGZkNWI4MDM1OTA2MDIwMDE5MTg0NjAwMTgzMDI4NDAxMTE2NDAxMDAwMDAwMDA4MzExMTcxNTYxMDE0MzU3NjAwMDgwZmQ1YjkwOTE5MjkzOTE5MjkzOTA1MDUwNTA2MTAyYTU1NjViMDA1YjM0ODAxNTYxMDE2MTU3NjAwMDgwZmQ1YjUwNjEwMTZhNjEwNDRiNTY1YjYwNDA1MTgwODI3M2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYxNjczZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZjE2ODE1MjYwMjAwMTkxNTA1MDYwNDA1MTgwOTEwMzkwZjM1YjM0ODAxNTYxMDFiODU3NjAwMDgwZmQ1YjUwNjEwMWZiNjAwNDgwMzYwMzYwMjA4MTEwMTU2MTAxY2Y1NzYwMDA4MGZkNWI4MTAxOTA4MDgwMzU3M2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYxNjkwNjAyMDAxOTA5MjkxOTA1MDUwNTA2MTA0OGU1NjViMDA1YjM0ODAxNTYxMDIwOTU3NjAwMDgwZmQ1YjUwNjEwMjRjNjAwNDgwMzYwMzYwMjA4MTEwMTU2MTAyMjA1NzYwMDA4MGZkNWI4MTAxOTA4MDgwMzU3M2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYxNjkwNjAyMDAxOTA5MjkxOTA1MDUwNTA2MTA1YmE1NjViMDA1YjM0ODAxNTYxMDI1YTU3NjAwMDgwZmQ1YjUwNjEwMjYzNjEwNjZlNTY1YjYwNDA1MTgwODI3M2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYxNjczZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZjE2ODE1MjYwMjAwMTkxNTA1MDYwNDA1MTgwOTEwMzkwZjM1YjYxMDJhZDYxMDY2ZTU2NWI3M2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYxNjMzNzNmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmMTYxNDYxMDM0ZDU3NjA0MDUxN2YwOGMzNzlhMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwODE1MjYwMDQwMTgwODA2MDIwMDE4MjgxMDM4MjUyNjAxNDgxNTI2MDIwMDE4MDdmNzM2NTZlNjQ2NTcyMjA3NzYxNzMyMDZlNmY3NDIwNmY3NzZlNjU3MjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDgxNTI1MDYwMjAwMTkxNTA1MDYwNDA1MTgwOTEwMzkwZmQ1YjYxMDM1NjgzNjEwNDhlNTY1YjYwMDA2MDYwODQ3M2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYxNjg0ODQ2MDQwNTE4MDgzODM4MDgyODQzNzgwODMwMTkyNTA1MDUwOTI1MDUwNTA2MDAwNjA0MDUxODA4MzAzODE4NTVhZjQ5MTUwNTAzZDgwNjAwMDgxMTQ2MTAzYzM1NzYwNDA1MTkxNTA2MDFmMTk2MDNmM2QwMTE2ODIwMTYwNDA1MjNkODI1MjNkNjAwMDYwMjA4NDAxM2U2MTAzYzg1NjViNjA2MDkxNTA1YjUwODA5MjUwODE5MzUwNTA1MDgxNjEwNDQ0NTc2MDQwNTE3ZjA4YzM3OWEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA4MTUyNjAwNDAxODA4MDYwMjAwMTgyODEwMzgyNTI2MDFlODE1MjYwMjAwMTgwN2Y2OTZlNjk3NDY5NjE2YzY5N2E2MTc0Njk2ZjZlMjA2MzYxNmM2YzYyNjE2MzZiMjA2NjYxNjk2YzY1NjQwMDAwODE1MjUwNjAyMDAxOTE1MDUwNjA0MDUxODA5MTAzOTBmZDViNTA1MDUwNTA1MDU2NWI2MDAwODA2MDQwNTE4MDgwN2Y2ZjcyNjcyZTYzNjU2YzZmMmU2OTZkNzA2YzY1NmQ2NTZlNzQ2MTc0Njk2ZjZlMDAwMDAwMDAwMDAwMDAwMDAwODE1MjUwNjAxNzAxOTA1MDYwNDA1MTgwOTEwMzkwMjA5MDUwODA1NDkxNTA1MDkwNTY1YjYxMDQ5NjYxMDY2ZTU2NWI3M2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYxNjMzNzNmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmMTYxNDYxMDUzNjU3NjA0MDUxN2YwOGMzNzlhMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwODE1MjYwMDQwMTgwODA2MDIwMDE4MjgxMDM4MjUyNjAxNDgxNTI2MDIwMDE4MDdmNzM2NTZlNjQ2NTcyMjA3NzYxNzMyMDZlNmY3NDIwNmY3NzZlNjU3MjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDgxNTI1MDYwMjAwMTkxNTA1MDYwNDA1MTgwOTEwMzkwZmQ1YjYwMDA2MDQwNTE4MDgwN2Y2ZjcyNjcyZTYzNjU2YzZmMmU2OTZkNzA2YzY1NmQ2NTZlNzQ2MTc0Njk2ZjZlMDAwMDAwMDAwMDAwMDAwMDAwODE1MjUwNjAxNzAxOTA1MDYwNDA1MTgwOTEwMzkwMjA5MDUwODE4MTU1ODE3M2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYxNjdmYWI2NGY5MmFiNzgwZWNiZjRmMzg2NmY1N2NlZTQ2NWZmMzZjODk0NTBkY2NlMjAyMzdjYTdhOGQ4MWZiN2QxMzYwNDA1MTYwNDA1MTgwOTEwMzkwYTI1MDUwNTY1YjYxMDVjMjYxMDY2ZTU2NWI3M2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYxNjMzNzNmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmMTYxNDYxMDY2MjU3NjA0MDUxN2YwOGMzNzlhMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwODE1MjYwMDQwMTgwODA2MDIwMDE4MjgxMDM4MjUyNjAxNDgxNTI2MDIwMDE4MDdmNzM2NTZlNjQ2NTcyMjA3NzYxNzMyMDZlNmY3NDIwNmY3NzZlNjU3MjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDgxNTI1MDYwMjAwMTkxNTA1MDYwNDA1MTgwOTEwMzkwZmQ1YjYxMDY2YjgxNjEwNmIxNTY1YjUwNTY1YjYwMDA4MDYwNDA1MTgwODA3ZjZmNzI2NzJlNjM2NTZjNmYyZTZmNzc2ZTY1NzIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA4MTUyNTA2MDBlMDE5MDUwNjA0MDUxODA5MTAzOTAyMDkwNTA4MDU0OTE1MDUwOTA1NjViNjAwMDYwNDA1MTgwODA3ZjZmNzI2NzJlNjM2NTZjNmYyZTZmNzc2ZTY1NzIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA4MTUyNTA2MDBlMDE5MDUwNjA0MDUxODA5MTAzOTAyMDkwNTA4MTgxNTU4MTczZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZjE2N2Y1MDE0NmQwZTNjNjBhYTFkMTdhNzA2MzViMDU0OTRmODY0ZTg2MTQ0YTIyMDEyNzUwMjEwMTRmYmYwOGJhZmUyNjA0MDUxNjA0MDUxODA5MTAzOTBhMjUwNTA1NmZlYTE2NTYyN2E3YTcyMzA1ODIwZDAwMTUxNzVmZTQ3YzM2YWI1ZWRiNTcwMjAyNTg4MTdhZTQwZTlmNWUxOWVkY2YwYWM4NzA2M2ZmOGNmNTlhMzAwMjkiLCJzdG9yYWdlIjp7IjB4MzRkYzVhMjU1NmIyMDMwOTg4NDgxOTY5Njk2ZjI5ZmVkMzhkNDU4MTNkODAwM2Y2YzcwZTVjMTZhYzkyYWUwZiI6IjQ3ZTE3MkY2Q2ZCNmM3RDAxQzE1NzRmYTNFMkJlN0NDNzMyNjlEOTUifSwiYmFsYW5jZSI6IjAifX0sIm51bWJlciI6IjB4MCIsImdhc1VzZWQiOiIweDAiLCJtaXhIYXNoIjoiMHg2Mzc0Njk2MzYxNmMyMDYyNzk3YTYxNmU3NDY5NmU2NTIwNjY2MTc1NmM3NDIwNzQ2ZjZjNjU3MjYxNmU2MzY1IiwicGFyZW50SGFzaCI6IjB4MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCJ9"
}
