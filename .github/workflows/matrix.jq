{
  include: [
    {image_type: "base", os_type: "ubuntu"} | select($changes["base-ubuntu"] == "true"),
    {image_type: "base", os_type: "centos"} | select($changes["base-centos"] == "true"),
    {image_type: "ci", os_type: "ubuntu"} | select($changes["ci-ubuntu"] == "true"),
    {image_type: "ci", os_type: "centos"} | select($changes["ci-centos"] == "true"),
    {image_type: "runner", os_type: "ubuntu"} | select($changes["runner-ubuntu"] == "true"),
    {image_type: "runner", os_type: "centos"} | select($changes["runner-centos"] == "true")
  ] | map(select(.)) | if length == 0 then [{"image_type": "none", "os_type": "none"}] else . end
}