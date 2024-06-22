# φ Dataset

> This is presently not much more than an experiment

OpenDiffusion Dataset (better name pending) is a tool to help the OpenDiffusion
community build datasets to train a fancy new diffusion model.

The following features are planned:

- [x] Creating collections
- [x] Attaching image URLs to collections
  - [x] Verify the URLs are valid and exists
  - [x] Manual creation
  - [] CSV Import
  - [] Parquet import
- [-] Attaching ratings to those images
- [-] Attaching captions to those images
- [-] Multiple captions/ratings car be attached to an image to support multiple
  models/approach
- [] Job Runner API
  - Fetch bundles of images with ratings/captions missing for processing on a
    local GPU.
  - Submit ratings/captions bundles back.
- [] Allow humans to create/review/edit captions and ratings
  - [] Implement a karma system to build trust in users


[Boiler plate here]
