![image](screenshot.png)

# 🎨 Duckx Canvas

**Duckx Canvas** is a high-performance, GPU-accelerated infinite canvas and graphic editor. Built with **Rust** and powered by **GPUI** (the modern GPU-accelerated UI framework from the creators of Zed Editor), Duckx Canvas is designed to be lightweight, responsive, and aesthetically stunning.

The application follows the **Floating Island UI** design concept, providing a premium, clutter-free user experience with mathematically symmetrical nesting layout structures.

---

## ✨ Key Features

### 🚀 1. GPU-Accelerated Infinite Canvas
*   **Infinite Panning & Zooming:** Seamless navigation across a limitless board with zero performance degradation.
*   **Lyon Path Tessellation:** High-performance vector graphic rendering for complex shapes.

### 📦 2. Comprehensive Object Model
*   **Images (`ImageObject`):** Drop image files (`png`, `jpg`, `jpeg`, `webp`, `gif`, `bmp`, `ico`) onto the canvas. Support for placing multiple files laid out in an automatic Flexbox grid, scaling with locked aspect ratios, and quantized rotation with image cache optimization.
*   **Rich Text (`TextObject`):** Customizable text boxes with custom fonts, colors, border styles (solid or dashed), and margins/paddings that dynamically scale relative to the canvas zoom level.
*   **Code Blocks (`CodeBlockObject`):** Insert code snippets with built-in syntax highlighting, customized monospace font support, and line-by-line scrolling.
*   **Live Markdown (`MarkdownObject`):** Write and render formatted Markdown documents side-by-side directly on the infinite canvas.
*   **Bookmark Cards (`BookmarkObject`):** Create visual links and bookmark boxes that resize dynamically to fit their labels.
*   **Grouping Frames (`FrameObject`):** Create visual boundaries to organize, group, and align objects. Supports nesting and importing external frames.
*   **Shapes & Vector Art:**
    *   *Rectangle:* Corner rounding (radius) and dashed border adjustments.
    *   *Circle/Ellipse:* Customizable circle bounds and properties.
    *   *Polygon:* Adjust the number of sides dynamically from 3 to 64.
    *   *Lines & Arrows:* Draw lines with dashed options and toggle start/end arrowheads.
    *   *Draw/Ink:* Draw freehand sketches using custom pencil/brush colors, thickness, and eraser modes.

### 🛠️ 3. Advanced Editing & Selection Tools
*   **Vector Path Editor:** Toggle edit mode to modify Bezier paths directly. Add/delete anchors, manipulate control handles, and round specific corners using the round-corner tool.
*   **Interactive Transform:** Select multiple items, scale, and rotate objects with real-time feedback. Maintain original aspect ratios by holding `Shift`.
*   **Global Screen Eyedropper:** Sample any color pixel from your screen globally and apply it instantly to canvas fills, strokes, or theme presets.

### 🎨 4. Theme Engine & Modern Design Language
*   **Floating Island UI:** Floating menus, toolbars, property editors, and dialogs with smooth drop shadows.
*   **Theme Catalog & Customization:** Instantly switch between presets like `Duckx Light`, `Duckx Dark`, and `Catppuccin Mocha`. Fine-tune specific color or layout parameters using live sliders directly within Settings.
*   **Nested Curves Rule:** Ensures mathematical visual balance across components following the formula:
    $$R_{\text{outer}} = R_{\text{inner}} + \text{gap}$$

### 💾 5. Native Save Format (`.duckx`)
*   Saves workspaces in a structured, compressed zip package storing the Canvas state, local fonts, configurations, and extracted image assets in one portable file.

---

## 🛠️ Technology Stack

*   **Rust** (Edition 2021)
*   **GPUI** — UI and Graphics windowing system from Zed Industries.
*   **Lyon** — 2D vector path rendering and tessellation.
*   **Photon-rs & Image** — Image loading and processing utilities.
*   **RFD (Rust File Dialogs)** — System native file pickers.
*   **Windows Sys** — Low-level OS window behavior integrations (Topmost, Click-through, Focus).


---

## 📥 Installation

You can install Duckx Canvas instantly using our one-line installer scripts.

### 🪟 Windows (via PowerShell or curl)
Open PowerShell and run:
```powershell
irm https://raw.githubusercontent.com/Manuree/Duckx-Canvas/main/install.ps1 | iex
```
*Or via standard cmd/git-bash using curl:*
```cmd
curl.exe -sSfL https://raw.githubusercontent.com/Manuree/Duckx-Canvas/main/install.ps1 -o install.ps1 && powershell -ExecutionPolicy Bypass -File install.ps1 && del install.ps1
```

---
### 🗑️ Uninstallation

If you wish to remove Duckx Canvas:

#### Windows (PowerShell):
Run this command in PowerShell to clean up everything automatically:
```powershell
irm https://raw.githubusercontent.com/Manuree/Duckx-Canvas/main/uninstall.ps1 | iex
```
or

```Remove-Item -Recurse -Force "$HOME\.duckx-canvas"
Remove-Item -Force "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Duckx Canvas.lnk"
$InstallDir = Join-Path $HOME ".duckx-canvas\bin"
$UserPath = [Environment]::GetEnvironmentVariable("PATH", "User")
$NewPath = ($UserPath -split ";" | Where-Object { $_ -ne $InstallDir }) -join ";"
[Environment]::SetEnvironmentVariable("PATH", $NewPath, "User")
```

---


