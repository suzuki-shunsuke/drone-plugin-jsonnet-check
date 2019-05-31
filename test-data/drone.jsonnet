{
  kind: "pipeline",
  name: "test",
  steps: [
    {
      name: "test .drone.yml",
      image: "suzukishunsuke/jsonnet-check:local",
      settings: {
        format: true,
      },
    },
  ],
}
