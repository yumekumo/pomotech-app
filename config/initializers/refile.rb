require "refile/s3"

aws = {
  access_key_id: "AKIA32TGNUW4DW6ZYC4M",
  secret_access_key: "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",
  region: "ap-northeast-1",
  bucket: "rails-user-icon",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)