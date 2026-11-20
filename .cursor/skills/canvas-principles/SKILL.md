---
name: canvas-principles
description: Follow before changing Duckx Canvas source, the node graph, or the UI. Name data shapes first, keep image baking off the UI thread, and treat .duckx, OCR, and local translation as boundaries.
---

# Canvas principles

- Name canvas and node-graph data shapes before coding.
- Keep UI-thread work separate from image baking.
- Parse `.duckx`, OCR, and local translation at the boundary.
- Prefer the Floating Island UI (outer radius = inner radius + gap).
- When a runnable GPUI window exists, prove pan/zoom and graph eval with a real measurement before calling the work done.
- Until the app crate exists, do not require browser or GUI control.
