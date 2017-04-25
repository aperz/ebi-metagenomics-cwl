#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

inputs:
  table_hits:
    type: File
    label: output of infernal's cmscan or cmsearch

outputs:
 SSU_coordinates:
   type: File
   outputSource: extract_coords/matched_seqs_with_coords

steps:
  grep:
    run: pull-SSUs.cwl
    in: { hits: table_hits }
    out: [ SSUs ]

  extract_coords:
    run: extract-coords-from-cmscan.cwl
    in: { infernal_matches: grep/SSUs }
    out: [ matched_seqs_with_coords ]
