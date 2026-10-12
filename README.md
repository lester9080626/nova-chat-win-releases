# Nova Chat: A Private AI Companion for Windows

![Platform](https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-0078D6?logo=windows)
![.NET](https://img.shields.io/badge/.NET-10-512BD4?logo=dotnet)
![Inference](https://img.shields.io/badge/inference-llama.cpp-1f6feb)
![Speech](https://img.shields.io/badge/speech-Whisper%20(on--device)-1f6feb)
![Privacy](https://img.shields.io/badge/privacy-on--device%20by%20default-2ea043)

**Nova Chat is a desktop AI companion that runs on your own PC.** It lives in the system tray and sits as a translucent panel at the top of your screen. It can listen and reply hands-free, and you can keep it out of screen shares and recordings.

It is built with **C# / Windows Forms on .NET 10**. By default it runs [Gemma 4 E4B Uncensored (HauhauCS, Aggressive)](https://huggingface.co/HauhauCS/Gemma-4-E4B-Uncensored-HauhauCS-Aggressive) through [llama.cpp](https://github.com/ggml-org/llama.cpp), and it transcribes speech with [Whisper](https://github.com/ggml-org/whisper.cpp), also on your PC. You don't need a cloud account, an API key, or a separate model install, and the app has no telemetry. To use a hosted model, you can switch to any OpenAI-compatible API in the Settings window.

| | |
|---|---|
| **On-device AI** | The app installs llama.cpp and the model for you on first launch. Your conversations stay on your computer. |
| **Hands-free input** | Transcribes speech from the sound playing on your PC (videos, calls) or from a microphone, then sends each phrase automatically. |
| **Hidden from screen sharing** | Keeps every Nova Chat window out of screen shares, screenshots, and recordings. An on-screen dot shows whether this is working. |
| **Stays out of your way** | Translucent and always on top. **Click-through** lets your clicks reach the windows behind it, and one global shortcut turns it on or off. |
| **Organized conversations** | Each chat is saved separately and has its own memory. You can open, rename, and delete chats from the tray. |
| **Your instructions, your sources** | Replace the default persona with your own instructions. You can also add PDFs, Office documents, and text files for the AI to use as reference. |

> **About the model:** this is an "abliterated" (uncensored) build of Google's Gemma 4 E4B-IT, so it will not refuse prompts.
> You are responsible for how you use it. The model is released under the [Gemma license](https://ai.google.dev/gemma/terms). See [Responsible Use](#responsible-use).

---

## Table of Contents

- [What's New](#whats-new)
- [Features](#features)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [First-Time Setup](#first-time-setup)
- [Using Nova Chat](#using-nova-chat)
- [Settings](#settings)
- [Privacy & Data](#privacy--data)
- [Configuration (`appsettings.json`)](#configuration-appsettingsjson)
- [Using LM Studio, Ollama, or Your Own llama-server](#using-lm-studio-ollama-or-your-own-llama-server)
- [Architecture](#architecture)
- [Troubleshooting](#troubleshooting)
- [Known Limitations](#known-limitations)
- [Roadmap](#roadmap)
- [Responsible Use](#responsible-use)
- [Contributing](#contributing)
- [Acknowledgements](#acknowledgements)

---

## What's New

### v1.4.2

| Area | What changed |
|---|---|
| **Dark message boxes** | Confirmations, warnings, and notices use Nova Chat's own dark dialog instead of the light Windows one. Answers, default buttons, and keys (Enter, Esc, Y / N) work as before. |
| **Dark window chrome** | Dark title bars on the Settings, Chats, and setup windows, and dark scroll bars in the chat window, Settings pages, text boxes, lists, and drop-downs. |
| **Drop-downs and disabled options** | Drop-down lists are drawn in the app's colors with an accent highlight. Turned-off sections are dimmed but still readable. |
| **Settings layout** | The version and **Update** button share the row with **Save** and **Cancel**, so the Appearance and Instructions pages fit without scrolling. The Shortcut page reads top to bottom: click-through, show / hide, then the reply shortcuts. |
| **Status line** | The screen-sharing status sits at the right end of the line under the input box on a small dark pill, so it stays crisp over any background. The listening status and tooltips match. |
| **Chats window** | The description is no longer cut off, and the list's header corner is dark. |

### v1.4.1

| Area | What changed |
|---|---|
| **Public releases** | Installers and portable builds are published to the public [nova-chat-win-releases](https://github.com/lester9080626/nova-chat-win-releases) repository, which is where the in-app updater looks for new versions. |
| **Alt+Tab** | The chat window is a tool window, so it no longer shows up in Alt+Tab. |

### v1.4.0

| Area | What changed |
|---|---|
| **Activity tracking** | The app records a running log of your activity (window titles, input) and produces a daily digest. An AI intent detector identifies the task you're working on so the companion can give context-aware suggestions. |

### v1.3.1

| Area | What changed |
|---|---|
| **Auto-updater** | The app checks for a new GitHub release at startup and shows an update prompt with a one-click download link. |

### v1.3.0

| Area | What changed |
|---|---|
| **Reply navigation** | Arrow buttons on the window's edge and global shortcuts (**Shift+Up** / **Shift+Down** by default) step through every reply in the current chat without opening any other window. |
| **Scrollable chat bubble** | Long replies are scrollable directly in the window. |

### v1.2.1

| Area | What changed |
|---|---|
| **Response source** | The reply's source line now shows the active model name alongside the provider. |

### v1.2.0

| Area | What changed |
|---|---|
| **In-app update checker** | The app checks for a new GitHub release at startup and shows an update prompt with a one-click download link. |

### v1.1.0

| Area | What changed |
|---|---|
| **Show / Hide window shortcut** | A global shortcut (separate from click-through) brings the chat window into view or hides it from any app. |
| **AI model chaining** | Add up to six extra models in **Settings → AI model**. Each model pre-processes the reply before it reaches the next, so you can chain a fact-checker, a style rewriter, or any other step before the base model. |

### v1.0.1 and earlier

| Area | What changed |
|---|---|
| **System tray app** | Nova Chat runs from the notification area instead of the taskbar. The tray menu holds chats, window options, listening, settings, and Exit. |
| **Speech input** | Transcribes speech on your PC from **PC audio** (WASAPI loopback, so no microphone is needed) or from a **microphone**. It uses WebRTC voice detection and Whisper, and can detect the spoken language automatically. |
| **Always on top** | Can be switched on or off from the tray, and the choice is remembered. |
| **Window and reply position** | The window can sit at the top, center, or bottom of the screen, and the reply on the left, in the center, or on the right. In **Dynamic** mode, with click-through on, each moves out of the way of your clicks. |
| **Click-through** | The window lets clicks pass to the apps behind it. A global shortcut (default: tap **Alt**) turns this on or off from any app. |
| **Appearance** | The font, bold / italic / underline, text size, the width of the Responder's chat bubble, and the opacity of the window, chat bubbles, and input box can each be adjusted, with a live preview. |
| **AI instructions & sources** | Write your own instructions, and add PDF, Word, PowerPoint, Excel, OpenDocument, HTML, or text files as reference material. |
| **Chat sessions** | Chats are saved to disk and each one has its own memory. You can switch, rename, and delete them. |
| **Markdown or plain text** | One tick in the tray menu switches replies between formatted Markdown (headings, lists, bold, code, quotes, tables) and plain text. The reply on screen changes at once. |
| **Hide from screen sharing** | Every app window is excluded from capture through Windows display affinity. A live green or red status dot shows the result. |
| **Settings window** | One window with six pages: **AI model**, **Appearance**, **Position**, **Input**, **Shortcut**, and **Instructions**. |

## Features

### Private, local AI
- Chats with Gemma 4 E4B through llama.cpp's OpenAI-compatible server on `127.0.0.1`.
- Starts `llama-server` in the background, waits for the model to load, and stops the server on exit. If a server is already running at the configured address, the app uses it instead.
- Replies **stream in** as the model generates them.
- **Markdown formatting**, switched from the tray menu: replies show headings, bold and italic text, links, inline code and code blocks, numbered, bulleted, and task lists, quotes, rules, and tables. With it off, replies are plain text. The AI is told which format the window shows.
- Prefer a hosted model? Switch to **OpenAI, Anthropic (Claude), Google Gemini, OpenRouter, Groq**, or any OpenAI-compatible URL. The API key is encrypted with Windows DPAPI for your Windows account.

### One-click first-time setup
- On first launch, the app checks the PC and installs whatever is missing:
  - **llama.cpp**, using `winget install llama.cpp`. If winget isn't available, the app downloads the latest Windows build from GitHub, plus the Visual C++ Runtime if needed.
  - **The Gemma 4 E4B model** (about 5 GB, Q4_K_M) from Hugging Face. The download can be paused and resumed.
- Setup shows progress, speed, and time remaining.
- Already have a GGUF file? Choose **I have the model...**. Want to skip the local install? Choose **Use an online API...**.

### Hands-free speech input
- **Listen to PC audio:** transcribes what plays through your speakers or headphones, such as a video or the other side of a call. No microphone is opened.
- **Listen to a microphone:** transcribes your own voice, or any input device you choose.
- Only speech is transcribed. A voice activity detector skips music, game sound, and silence. Whisper's sound tags such as `[Music]` and `(laughs)` are removed.
- Each phrase is sent **automatically** when the speaker pauses. Phrases heard while a reply is streaming wait and are sent together when the reply finishes.
- If you listen to the Windows default device, the app switches automatically when the default changes, and it recovers by itself if a device drops out.
- The Whisper `base` model (about 140 MB) is downloaded the first time speech input is turned on. It runs on the CPU.

### Hidden from screen sharing
- Uses Windows' `WDA_EXCLUDEFROMCAPTURE` display affinity. The windows still show on your monitor but are left out of the captured image. This covers apps that capture through Windows' capture APIs, such as browsers (Google Meet), Zoom, Teams, Discord, OBS, AnyDesk, TeamViewer, and the Snipping Tool.
- It applies to **every** window the app opens, not just the chat window: the text overlays, Settings, Chats, the tray menu, tooltips, and message boxes. It is applied before any window first appears.
- A status dot under the input box shows the setting as Windows reports it: **green**, *Hidden from screen sharing*, or **red**, *Visible in screen sharing* or *Can't hide from screen sharing*.
- On by default. You can turn it off from the tray menu.

### A heads-up window that stays out of your way
- A dark, translucent panel docked at the **top**, **center**, or **bottom** of the screen, always centered across. Its height adjusts to fit the reply (at the bottom it grows upward), and you can drag the left or right edge to change the width.
- The reply's bubble can sit on the **left**, in the **center**, or on the **right** of the window. On the right its tail points right; in the center it has none.
- **Dynamic position**, for the window, the reply, or both: while click-through is on, they move away from where you click, so they never cover what you're working on. A click in the upper half of the screen sends the window to the bottom, and a click in the lower half sends it to the top. A click in the left half sends the reply to the right, and a click in the right half sends it to the left. Clicks on the taskbar, on another screen, or on Nova Chat's own windows don't move anything.
- Shows the **latest reply only**. The full conversation is kept in the chat and remembered by the AI.
- **Always on top**, which you can turn off.
- **Click-through**: clicks and scrolling go to the windows behind Nova Chat, so you can keep working underneath it. Turn it on or off with a global shortcut (default: tap **Alt**), or from the tray. While it's on, the hint line under the input box says so.
- **Appearance controls**: any installed font, bold / italic / underline, text size (9 to 24 pt), how wide the Responder's bubble may grow (50% to 100% of the message area), and separate opacity for the window, the bubbles, and the input box. Text is drawn in a more opaque layer, so it stays readable even when the window is very faint.
- Windows 11 rounded corners, a dark tray menu, and an app icon drawn in code.

### Chats that remember and persist
- Every chat is saved as its own JSON file. The AI only sees the turns of the chat that's open, so what you say in one chat isn't remembered in another.
- The tray's **Chats** menu lists your 25 most recent chats. **Manage chats...** opens the full list, where you can open, rename (F2), or delete chats (Del, or Ctrl+A to select all).
- A chat is named after its first message until you rename it.

### Instructions and reference sources
- Replace the built-in diary-companion persona with your own instructions, or go back to the default with one click.
- Add **sources** for the AI to use as reference with every message:
  - **Documents:** PDF, `.docx`, `.pptx`, `.xlsx`, `.odt`, `.odp`, `.ods`
  - **Web pages:** `.html` and `.htm` (only the visible text is used)
  - **Text formats:** `.txt`, `.md`, `.yaml`, `.json`, `.xml`, `.csv`, `.properties`, `.log`, and other plain text
- Files are read again before every message, so edits to them take effect immediately. Parsed documents are cached until the file changes.
- The Settings window shows the status of each file (found, unreadable, or a scanned PDF with no text) and the total number of characters used.

## Requirements

| Requirement | Details |
|---|---|
| OS | Windows 10 / 11, 64-bit. Hiding from screen sharing needs **Windows 10 version 2004 or later**. |
| SDK | [.NET 10 SDK](https://dotnet.microsoft.com/download) (to build) |
| Architecture | x64. The voice detector ships a native DLL for each platform, so the project targets x64. |
| llama.cpp | **Installed automatically on first run.** If it's already installed (on `PATH`, by winget, or next to the app), the app finds it and uses it. |
| Disk | About 5 GB for the Q4_K_M model, plus about 140 MB for the speech model |
| RAM / VRAM | About 8 GB of RAM is enough for CPU inference. A GPU with 6 GB or more of VRAM is much faster (`-ngl 99` puts all layers on the GPU). |
| Audio (optional) | Any output device for **Listen to PC audio**, or a microphone |
| Internet | Only for the first-time setup and the one-time speech model download. Not needed with a local model after that. |

## Getting Started

### Download

Every release is published at <https://github.com/lester9080626/nova-chat-win-releases/releases> with two files:

| File | What it is |
|---|---|
| `NovaChat-<version>-win-x64-setup.exe` | **The installer (recommended).** Installs for your Windows account only, so no administrator rights are needed, and adds Start menu and optional desktop shortcuts. Uninstall it from **Settings → Apps**. |
| `NovaChat-<version>-win-x64.zip` | **The installed files, without the installer.** Unzip it anywhere and run `WinFormsApp1.exe`. The in-app updater downloads this file. |

The executable isn't code-signed, so Windows SmartScreen or Defender may warn about it the first time. Choose **More info → Run anyway**, or allow it in **Settings → Privacy & security**.

### 1. Clone and run

```bash
git clone https://github.com/Lester-Org/ai-companion-win-app.git
cd ai-companion-win-app
dotnet run --project WinFormsApp1/WinFormsApp1.csproj
```

You can also open `WinFormsApp1.slnx` in Visual Studio and press **F5**.

On the first launch, the [first-time setup](#first-time-setup) window installs everything else. Nova Chat then appears at the top of the screen, and its icon appears in the notification area.

> **Tip:** Windows may put new tray icons in the overflow area (**^**). Drag the Nova Chat icon onto the taskbar to keep it in view.

### 2. Publish a standalone build (optional)

```bash
dotnet publish WinFormsApp1/WinFormsApp1.csproj -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true
```

Distribute the whole publish folder, not just the `.exe`. `appsettings.json` and the native libraries for speech recognition are published next to the executable.

## First-Time Setup

Every time the app starts, it checks for two things:

| Item | Where the app looks |
|---|---|
| **llama.cpp** (`llama-server.exe`) | the app folder → `%LOCALAPPDATA%\NovaChat\llama.cpp` → the WinGet `Links` and `Packages` folders → `PATH` |
| **Model** (`Gemma-4-E4B-Uncensored-HauhauCS-Aggressive-Q4_K_M.gguf`) | `%LOCALAPPDATA%\NovaChat\models\` |

If either one is missing, the **"Welcome to Nova Chat"** setup window opens. Each item is listed as found (✔), missing (○), in progress (➤), or failed (✖).

| Button | What it does |
|---|---|
| **Install** | Installs everything that is missing, in the order shown below. |
| **I have the model...** | Uses a `.gguf` file you already downloaded. The choice is saved for future sessions. |
| **Use an online API...** | Skips the local install and opens the online API settings. |
| **Not now** / **Cancel** | Skips setup and pauses any install in progress. Setup opens again on the next start, or when you send a message. |

### What Install does

1. **llama.cpp** (when `Server.Install.Method` is `Auto`, the default):
   1. Runs this command silently:
      ```
      winget install --id ggml.llamacpp --exact --source winget --accept-package-agreements --accept-source-agreements --silent
      ```
      winget also installs the Visual C++ Runtime that llama.cpp needs. The app finds the result in the WinGet folders immediately, so you don't need to restart or update `PATH`.
   2. If winget is missing or fails, the app gets the latest release from the GitHub releases API instead. It downloads `llama-<build>-bin-win-vulkan-x64.zip` (about 35 MB; the arm64 build on ARM PCs) and extracts it to `%LOCALAPPDATA%\NovaChat\llama.cpp`. If `vcruntime140.dll` is missing, it also installs the **Microsoft Visual C++ Redistributable**. Windows asks for administrator permission once for this.
2. **Model:** downloads the GGUF from Hugging Face to `<file>.gguf.part`, then renames it when the download finishes. If you cancel or the connection drops, choose **Resume** to continue where it stopped (the app uses HTTP Range requests).

When every item shows ✔, the window closes. The app then starts `llama-server -m <model> --jinja ...` and waits for the model to load. The tray tooltip changes to **Responder online**.

## Using Nova Chat

### The chat window

1. When the tray tooltip shows `Nova Chat • Responder online`, the model is ready.
2. Type in the input box, then press **Enter** or click **➤**. The box grows to show up to six lines.
3. The reply streams into a **Responder** bubble.
4. Click **🎤** to start or stop listening for speech. While speech input is on, the text box and **➤** are hidden, since each phrase is sent on its own, and the red **🎤** moves to the top left of the window (the bottom left when the window is at the bottom of the screen) with **Listening...** beside it (**Starting to listen...** while it gets ready, or **Not listening** if it couldn't start). Click it again to go back to typing.

| Key | Action |
|---|---|
| **Enter** | Send |
| **Shift + Enter** | New line |
| **Alt** (tap) | Turn click-through on or off, from any app (the shortcut can be changed) |
| **Shift+Up** | Step to the previous reply in the current chat (the shortcut can be changed) |
| **Shift+Down** | Step to the next reply in the current chat (the shortcut can be changed) |
| **Alt + F4** | Close Nova Chat (this also stops `llama-server`) |

The line under the input box shows a keyboard hint, the speech status, or a click-through notice. The screen-sharing status dot is at its right end.

### The tray menu

Left-click the tray icon to bring the chat window to the front. Right-click it for the menu:

| Item | What it does |
|---|---|
| **New chat** | Starts a new conversation with its own memory |
| **Chats ▸** | Your 25 most recent chats with the time each was last used. The open chat is checked. **Manage chats...** opens the full list. |
| **Always on top** | Keeps the window above other windows |
| **Click-through** | Lets clicks pass through the window. The menu shows the current shortcut. |
| **Hide from screen sharing** | Keeps every Nova Chat window out of screen shares, screenshots, and recordings |
| **Listen to PC audio** / **Listen to microphone** | Turns speech input on or off. The label shows which source is selected. |
| **Markdown formatting** | Ticked, replies are drawn formatted from their Markdown, and the AI is asked to use Markdown. Unticked, replies are shown as plain text, exactly as written, and the AI is asked not to use Markdown. The reply on screen switches at once, even while it is streaming; the AI gets the new instruction with your next message. |
| **Settings...** | Opens the Settings window |
| **Exit** | Closes the app and stops `llama-server` if the app started it |

**Settings**, **New chat**, and **Chats** are unavailable while a reply is streaming.

### Status

The window has no title bar, so the connection status is shown in the **tray icon's tooltip**: `Connecting to local model...`, `Starting llama-server...`, `Loading local model... 12s`, `Responder is typing...`, `Responder online`, `Online API • <model>`, or an error.

## Settings

Open **Settings...** from the tray menu. The window opens just below the chat window (or above it, when the chat is at the bottom of the screen), so you can see changes to its appearance as you make them.

| Page | What you can do | When it takes effect |
|---|---|---|
| **AI model** | **On this PC:** **Install** whatever is missing, switch models by pasting a new GGUF **download URL** (for example `https://huggingface.co/<owner>/<repo>/resolve/main/<file>.gguf`), **Use a model file...** already on this PC, or **Delete model** to free space. <br>**Online API:** pick a service (OpenAI, Anthropic (Claude), Google Gemini, OpenRouter, Groq, or **Other**), then enter the base URL, API key, and model ID. This is the **base model**, which writes the reply you see. <br>**More models (optional):** add up to 6 models (7 in total with the base), each **On this PC** (an OpenAI-compatible server such as Ollama, LM Studio, or llama-server, by base URL and model ID) or an **Online API**, with optional instructions of their own. Your message goes to the last model added first; each passes its reply to the model added before it, and the first one added hands it to the base model. **Mode** chooses what each model is given: your message plus the previous reply, or the previous reply only. **Edit** puts a model back in the fields to change it, and **Remove** takes it out. | Installing, changing, and deleting the model happen immediately. The provider, API fields, and added models apply on **Save**; a changed provider or API makes the chat reconnect. |
| **Appearance** | **Font** (any font installed on the PC) and **Font style** (**Bold**, **Italic**, and **Underline**, each on or off) for all the text in the chat window, **Text size** (9 to 24 pt), **Responder bubble width** (50% to 100% of the message area inside the window's padding; longer replies wrap at this width), **Window opacity**, **Chat bubble opacity**, and **Input box opacity** (10% to 100%), plus **Reset to defaults** | Previewed live. **Save** keeps the changes and **Cancel** restores the previous values. |
| **Position** | **Chat window:** **Fixed** at **Top**, **Center**, or **Bottom**, or **Dynamic**. **Reply bubble:** **Fixed** on the **Left**, in the **Center**, or on the **Right**, or **Dynamic**. Dynamic moves the window or the reply away from your clicks, but only while click-through is on; with it off they stay where they are, so they don't jump away when you click the chat. The alignments can only be chosen with **Fixed**, and choosing **Fixed** again puts it back at its alignment. | **Save** |
| **Input** | **Typing** or **Speech**. For speech, choose **Listen to** (sound playing on this PC, or a microphone), the device (the Windows default, or a specific device), and the **language** (detect automatically, English, Filipino, Spanish, Portuguese, French, German, Japanese, Korean, Chinese, Hindi, or Indonesian). | **Save**. Saving again also retries speech input if it failed to start. |
| **Shortcut** | The click-through shortcut and the two reply-navigation shortcuts (**Previous reply** and **Next reply**). Each can be **Alt**, **Ctrl**, or **Shift** tapped on its own, a key combined with Ctrl, Alt, or Shift (such as `Shift+Up`), or a function key (such as `F8`). **Backspace** removes a shortcut. Defaults: **Alt** for click-through, **Shift+Up** / **Shift+Down** for navigation. | **Save** |
| **Instructions** | Write your own **instructions** for the base model, or choose **Use the default instructions**. Models added under **More models** use their own instructions instead. Add or remove **source** files, which every model gets (the added models and the base model), and see each file's status and the total character count. | **Save** |

Deleting the model asks for confirmation first. If the app started `llama-server`, it stops the server, then deletes the model file and any partial download.

With an online API, only `temperature` is sent with the messages. `top_p`, `top_k`, and `max_tokens` are tuned for the local Gemma model, and some services reject them.

## Privacy & Data

Nova Chat is **local-first**. With the default local model, nothing you type or say leaves your PC.

| What | Where it lives | Leaves your PC? |
|---|---|---|
| Messages and replies | Sent to `llama-server` on `127.0.0.1` | **No**, unless you switch to an online API. Then messages *and sources* go to that service. Each online model added under **More models** also gets your messages (or, in **Previous reply only** mode, the reply passed to it), and the sources, but not the chat history. |
| Saved chats | `%LOCALAPPDATA%\NovaChat\chats\<id>.json`, one file per chat. Each file is written to a temporary file first, so a crash can't leave a chat half saved. | No |
| Audio | Processed in memory and transcribed on your PC by Whisper. **Never written to disk.** | No |
| Settings you change in the app | `%LOCALAPPDATA%\NovaChat\usersettings.json`. The API key is encrypted with Windows DPAPI for your Windows account. | No |
| Models | `%LOCALAPPDATA%\NovaChat\models\` (LLM and Whisper) | Downloaded once |
| llama.cpp (GitHub build) | `%LOCALAPPDATA%\NovaChat\llama.cpp\` | Downloaded once |

The app makes network requests only to the local model server, to the online API you configure, and to download llama.cpp and the models (winget, GitHub, and Hugging Face).

## Configuration (`appsettings.json`)

`appsettings.json` sits next to the executable. Comments and trailing commas are allowed. Any setting you leave out uses its built-in default.

Choices you make in the app (provider, API, model file, appearance, always on top, screen-share hiding, shortcut, input and speech, instructions, and sources) are saved to `%LOCALAPPDATA%\NovaChat\usersettings.json` and **override** this file. Delete that file to go back to `appsettings.json`.

### Model and provider

| Key | Default | Description |
|---|---|---|
| `Provider` | `Local` | `Local` (a model on this PC) or `Api` (an online service). Usually set in **Settings → AI model**. |
| `Api.BaseUrl` / `Api.Model` / `Api.ApiKey` | OpenAI / empty / `null` | The online API used when `Provider` is `Api`. Usually set in Settings, which stores the key encrypted. |
| `BaseUrl` | `http://127.0.0.1:8080/v1` | Address of the local OpenAI-compatible endpoint |
| `Model` | `Gemma-4-E4B-Uncensored-HauhauCS-Aggressive` | Model name sent with each request. llama-server ignores it; LM Studio and Ollama use it. |
| `ApiKey` | `null` | Sent as a Bearer token to the local server, if set |
| `SystemPrompt` | diary companion | The default instructions. Instructions written in **Settings → Instructions** replace them. Either way, a line saying whether to reply in Markdown or plain text is added after them, from the tray menu's **Markdown formatting**. |
| `CustomInstructions` | `null` | Your own instructions. They replace `SystemPrompt` when set. |
| `SourceFiles` | `[]` | Paths of the reference files sent with every message (12,000 characters in total) |
| `Temperature` / `TopP` / `TopK` | `1.0` / `0.95` / `64` | Sampling settings recommended by Google for Gemma 4 |
| `MaxTokens` | `1024` | Maximum length of a reply |
| `MaxHistoryMessages` | `20` | How many past messages from the open chat are sent as context |
| `RequestTimeoutSeconds` | `300` | Time limit for each reply |

### Model file and llama.cpp server

| Key | Default | Description |
|---|---|---|
| `ModelFile.Directory` | `%LOCALAPPDATA%\NovaChat\models` | Folder for the model. Environment variables are expanded. |
| `ModelFile.FileName` | `...-Q4_K_M.gguf` | Name of the GGUF file |
| `ModelFile.DownloadUrl` | Hugging Face `resolve/main/...Q4_K_M.gguf` | Where setup downloads the model from |
| `ModelFile.DisplaySize` | `about 5 GB` | Download size shown in the setup window |
| `ModelFile.ModelPageUrl` | Hugging Face model page | Link shown in setup |
| `ShowSetupWhenMissing` | `true` | Show the first-time setup window when llama.cpp or the model is missing |
| `Server.AutoStart` | `true` | Start `llama-server` if nothing is answering at `BaseUrl` |
| `Server.ExecutablePath` | `llama-server` | Path to `llama-server.exe`. A bare name is looked up next to the app first, then on `PATH`. |
| `Server.Arguments` | `-m {model} --jinja -c 8192 -ngl 99 --host 127.0.0.1 --port 8080` | `{model}` is replaced with the model's full path |
| `Server.ShowConsoleWindow` | `false` | Show llama-server's console window, which is useful for debugging |
| `Server.StartupTimeoutSeconds` | `300` | How long to wait for the model to load |
| `Server.Install.Method` | `Auto` | How setup installs llama.cpp: `Auto` (winget, then GitHub), `Winget`, `GitHub`, or `None` |
| `Server.Install.WingetPackageId` | `ggml.llamacpp` | winget package ID |
| `Server.Install.GitHubRepository` | `ggml-org/llama.cpp` | Repository used for the GitHub download |
| `Server.Install.GitHubBuild` | `vulkan` | Which Windows build to download: `vulkan` (NVIDIA, AMD, or Intel GPUs, and also works on CPU) or `cpu` |
| `Server.Install.Directory` | `%LOCALAPPDATA%\NovaChat\llama.cpp` | Where the GitHub build is extracted |

### Window, input, and speech

| Key | Default | Description |
|---|---|---|
| `AlwaysOnTop` | `true` | Keep the chat window above other windows |
| `ResponseFormat` | `PlainText` | `PlainText` or `Markdown`: how replies are shown, and which format the AI is asked for |
| `HideFromScreenSharing` | `true` | Keep every app window out of screen sharing, screenshots, and recordings |
| `WindowAlignment` / `WindowPositionMode` | `Top` / `Fixed` | Where the chat window sits (`Top`, `Center`, or `Bottom`), and whether it is `Fixed` there or `Dynamic`, moving away from clicks while click-through is on |
| `BubbleAlignment` / `BubblePositionMode` | `Left` / `Fixed` | The same for the reply's bubble: `Left`, `Center`, or `Right`, and `Fixed` or `Dynamic` |
| `ClickThroughShortcut` | `Alt` | Global shortcut for click-through, written as shown, such as `Alt`, `Ctrl+Alt+T`, `F8`, or `None` |
| `PreviousReplyShortcut` | `Shift+Up` | Global shortcut to step to the previous reply in the current chat |
| `NextReplyShortcut` | `Shift+Down` | Global shortcut to step to the next reply in the current chat |
| `Appearance.FontSize` | `13` | Message text size in points (9 to 24). The other text in the window scales with it. |
| `Appearance.FontFamily` | `Segoe UI` | The font of all the text in the chat window. A font that isn't installed is drawn in Segoe UI instead. |
| `Appearance.Bold` / `Italic` / `Underline` | `true` / `false` / `false` | The style of all the text in the chat window. If a font doesn't come in a style (some script fonts are italic only), its nearest style is used. |
| `Appearance.ResponderBubbleWidth` | `70` | The widest the Responder's bubble may grow before its text wraps, as a percentage (50 to 100) of the message area inside the window's padding. Short replies keep a smaller bubble. |
| `Appearance.WindowOpacity` / `BubbleOpacity` / `InputBoxOpacity` | `40` / `60` / `60` | Opacity percentages (10 to 100) |
| `InputMode` | `Typing` | `Typing` or `Speech` |
| `Speech.Source` | `PcAudio` | `PcAudio` (what plays through an output) or `Microphone` |
| `Speech.DeviceId` / `Speech.DeviceName` | `null` | A specific Windows audio device. `null` follows the Windows default. |
| `Speech.Language` | `auto` | A Whisper language code (`en`, `tl`, `ja`, ...), or `auto` to detect the language of each phrase |
| `Speech.ModelDirectory` | `%LOCALAPPDATA%\NovaChat\models` | Folder for the Whisper model |
| `Speech.ModelFileName` | `ggml-base.bin` | `ggml-small.bin` is more accurate but about three times larger and slower. The `.en` models only understand English. |
| `Speech.ModelDownloadUrl` | `huggingface.co/ggerganov/whisper.cpp/.../ggml-base.bin` | Where the speech model is downloaded from |
| `Speech.DisplaySize` | `about 140 MB` | Download size shown in Settings |

### Choosing a different quantization

The model page lists several sizes. Change `ModelFile.FileName` and `ModelFile.DownloadUrl` to match the one you want, or paste its URL in **Settings → AI model**:

| Quant | Size | Notes |
|---|---|---|
| Q8_K_P | 7.6 GB | Highest quality |
| Q6_K_P | 5.9 GB | |
| Q5_K_M | 5.4 GB | |
| **Q4_K_M** | **5.0 GB** | **Default. Good balance of size and quality.** |
| IQ4_XS | 4.8 GB | |
| Q3_K_M | 4.6 GB | |
| Q2_K_P | 4.2 GB | Smallest, lowest quality |

### Tips

- **Faster on CPU-only PCs:** add `-t <cores>` to the arguments. On a GPU, keep `-ngl 99`.
- **Longer memory:** raise `-c 8192`. The model supports up to 131K tokens of context, but more context uses more RAM. Sources are also part of the context.
- **Avoid port conflicts:** if port 8080 is already in use, change both `--port` and `BaseUrl`.

## Using LM Studio, Ollama, or Your Own llama-server

Any OpenAI-compatible local server works. Set `"Server": { "AutoStart": false }` and point `BaseUrl` at the server:

| Runtime | `BaseUrl` | `Model` | How to start it |
|---|---|---|---|
| llama-server (manual) | `http://127.0.0.1:8080/v1` | (ignored) | `llama-server -hf HauhauCS/Gemma-4-E4B-Uncensored-HauhauCS-Aggressive:Q4_K_M --jinja` |
| LM Studio | `http://127.0.0.1:1234/v1` | the model identifier shown in LM Studio | Load the model, then enable the local server in LM Studio |
| Ollama | `http://127.0.0.1:11434/v1` | `hf.co/HauhauCS/Gemma-4-E4B-Uncensored-HauhauCS-Aggressive:Q4_K_M` | `ollama pull hf.co/HauhauCS/Gemma-4-E4B-Uncensored-HauhauCS-Aggressive:Q4_K_M` |

When `AutoStart` is `false`, the setup window is never shown, because the external server manages its own engine and model.

## Architecture

### Project structure

```
ai-companion-win-app/
├── README.md
├── .gitignore                     # ignores bin/, obj/, .vs/, *.user, *.gguf
├── WinFormsApp1.slnx
└── WinFormsApp1/
    ├── WinFormsApp1.csproj        # net10.0-windows, x64; NAudio.Wasapi, Whisper.net, WebRtcVadSharp, PdfPig, Markdig
    ├── appsettings.json           # Model, server, and default settings
    ├── Program.cs                 # Entry point
    │
    ├── Form1.cs                   # Chat window: tray icon, overlays, layout, connecting, sending, streaming
    ├── Form1.Designer.cs          # Designer layout (message list, composer)
    ├── Form1.Chats.cs                     # New chat, the Chats menu, opening, renaming, and deleting chats
    ├── Form1.Replies.cs                   # Reply navigation: stepping through earlier turns with arrows and shortcuts
    ├── Form1.Speech.cs                    # Speech input mode: starts and stops listening, sends recognized phrases
    ├── Form1.ScreenShare.cs               # Hide-from-sharing toggle and the green/red status dot
    ├── Form1.Position.cs                  # The window's and the reply's alignment, and Dynamic positioning
    │
    ├── LlmSettings.cs             # Settings classes; loads appsettings.json + usersettings.json; DPAPI
    ├── LlmOptionsForm.cs          # Settings window: AI model, Appearance, Position, Input, Shortcut, Instructions
    ├── SetupForm.cs               # First-time setup window (installs llama.cpp and the model)
    ├── ChatsForm.cs               # Manage chats window (open, rename, delete)
    │
    ├── LocalLlmClient.cs          # OpenAI-compatible streaming client for /chat/completions
    ├── LlamaServerManager.cs      # Starts, health-checks, and stops llama-server
    ├── LlamaRuntime.cs            # Finds llama-server.exe; installs it with winget or from GitHub, plus the VC++ runtime
    ├── FileDownloader.cs          # Resumable HTTP downloader with progress reports
    ├── AiInstructions.cs          # Builds the system prompt from the instructions and sources
    ├── DocumentText.cs            # Extracts text from PDF, Office, OpenDocument, HTML, and plain text
    ├── ChatStore.cs               # ChatSession model; one JSON file per chat
    ├── SpeechListener.cs          # WASAPI capture → 16 kHz mono → WebRTC VAD → Whisper
    ├── ScreenShareHiding.cs       # Display affinity for every top-level window the app creates
    ├── Shortcuts.cs               # Shortcut parsing, the global keyboard hook, and the shortcut picker box
    ├── ClickWatcher.cs            # Global mouse hook for Dynamic positioning, installed only while it is needed
    │
    ├── OverlayWindow.cs           # Click-through layered window that draws above the chat at its own opacity
    ├── PromptTextPainter.cs       # Draws the input box's text, selection, and caret in the overlay
    ├── StyledControls.cs          # ChatMessageControl, IconButton, Slider, ChatFonts, RoundedRectangle, TextOpacity
    ├── MarkdownText.cs            # Lays out and draws a reply's Markdown (parsed with Markdig) inside its bubble
    ├── TrayVisuals.cs             # The app icon (drawn in code) and the dark tray menu renderer
    └── WindowCorners.cs           # Windows 11 rounded corners through DWM
```

### Key types

| Type | Responsibility |
|---|---|
| `Form1` | Owns the tray icon and overlays. Connects to the model, sends messages, streams replies, and shows status. Split into partial classes for chats, speech, and screen sharing. |
| `LlmSettings` and nested settings | Settings from `appsettings.json` with per-user overrides from `usersettings.json`. The API key is protected with DPAPI. Appearance values are clamped to valid ranges. |
| `LocalLlmClient` | `IsReadyAsync()` checks `GET /models`. `StreamChatAsync()` sends `POST /chat/completions` with `stream: true` and reads the SSE response. `CleanOutput()` removes Gemma's thinking blocks. |
| `LlamaServerManager` | `EnsureRunningAsync()` uses a running server if one exists, or starts `llama-server` and waits for it to load. `Dispose()` stops the server it started. |
| `SetupForm` / `LlamaRuntime` / `FileDownloader` | First-time setup checklist, finding and installing llama.cpp, and resumable downloads |
| `ChatSession` / `ChatStore` / `ChatsForm` | A conversation and its turns, saving each one to its own JSON file, and the window for managing them |
| `AiInstructions` / `DocumentText` | Builds the system prompt from the instructions, the reply format, and up to 12,000 characters of source text. Extracts text from each file format. |
| `SpeechListener` | Captures audio, detects speech, splits it into phrases, transcribes them with Whisper, and raises `TextRecognized` |
| `ScreenShareHiding` | Sets the display affinity of every top-level window in the process, including windows created later |
| `ShortcutWatcher` | A low-level keyboard hook that detects the click-through shortcut in any app, including a lone modifier tap |
| `ClickWatcher` | A low-level mouse hook that reports button presses outside the app's own windows. It is installed only while click-through is on and the window or the reply is in Dynamic mode. |
| `OverlayWindow` / `PromptTextPainter` / `ChatMessageControl` | The layered rendering that keeps text readable on a translucent window |
| `MarkdownLayout` / `MarkdownFonts` | Parses a reply with Markdig and lays it out to the bubble's width: wrapped text in several fonts, list markers, quote bars, code shading, and tables. The shading is drawn in the bubble overlay and the text in the text overlay. |

### Startup sequence

```
Form1 constructor
  ├─ ScreenShareHiding.Start()           ← before any window exists, so nothing appears in a capture
  ├─ load saved chats, open a new one
  └─ create the tray icon, apply always-on-top and the click-through shortcut

Form1_Shown → ConnectToModelAsync()      (in parallel: ApplyInputModeAsync() starts listening if Speech is on)
  ├─ Online API? → "Online API • <model>"
  ├─ Is a server already answering at BaseUrl (GET /models returns 200)?
  │     yes → "Responder online"
  ├─ Is llama-server.exe or the model missing?
  │     → SetupForm: winget install llama.cpp (or the GitHub zip + VC++ runtime),
  │                  then download the model from Hugging Face
  │         Not now → explain in the chat and stop
  └─ LlamaServerManager.EnsureRunningAsync()
        ├─ start llama-server -m "<model>" --jinja ...
        ├─ check GET /models every second (it returns 503 while the model loads)
        └─ ready → "Responder online"   |   exit or timeout → error shown in the chat
```

### Sending a message

```
Enter / ➤ / a recognized phrase → SendCurrentPromptAsync()
  ├─ append { role: "user" } to the open chat
  ├─ server not ready? → try to start it (and show the setup window if needed)
  └─ StreamReplyAsync()
        ├─ replace the window's bubble with an empty Responder bubble ("…")
        ├─ POST /chat/completions  { system: instructions + reply format + sources (AiInstructions.Build),
        │                            last N turns of this chat, stream: true,
        │                            temperature 1.0, top_p 0.95, top_k 64 }
        ├─ for each SSE "data:" chunk → append delta.content
        │      (the bubble is updated about every 50 ms and the window re-fitted)
        └─ done → CleanOutput() → append { role: "assistant" } → ChatStore.Save()
```

Error handling:

- **Server unreachable, HTTP error, or timeout:** the error is shown in the bubble. Any text that already arrived is kept and marked `[Reply interrupted: ...]`.
- **Closing the window:** cancels the request in progress, stops listening, stops `llama-server`, and removes the keyboard and WinEvent hooks.

### Speech pipeline

```
WASAPI loopback (PC audio) or WASAPI capture (microphone)
  └─ mix to mono → resample to 16 kHz (WDL resampler)
       └─ 30 ms frames → RMS silence gate → WebRTC VAD (very aggressive)
            └─ phrase = 300 ms pre-roll + speech, ending after ~0.45 s of silence
               (bursts under 300 ms are dropped; long speech is cut every 15 s)
                 └─ Whisper.net (no context between phrases, no-speech threshold 0.6)
                      └─ drop [Music], (laughs), ♪ … → TextRecognized → typed into the box and sent
```

Loopback capture delivers nothing while the PC is silent, so a timer ends the current phrase when the audio stops (for example, when a video is paused). When the app is listening to the Windows default device, it registers for device-change notifications and restarts on the new default.

### Hiding from screen sharing

- `SetWindowDisplayAffinity(WDA_EXCLUDEFROMCAPTURE)` removes a window from captures while it stays visible on the monitor. On Windows builds older than 2004, the app uses `WDA_MONITOR` instead, which shows the window as a black box in captures.
- Forms apply it in `OnHandleCreated`, before they are first shown. A process-wide `SetWinEventHook` (`EVENT_OBJECT_CREATE` / `EVENT_OBJECT_SHOW`) catches every other top-level window, such as menus, tooltips, message boxes, and file dialogs.
- The status dot reads the affinity back with `GetWindowDisplayAffinity` for the chat window **and** its three overlays. It only turns green when Windows confirms that all of them are excluded.

### Click-through and the global shortcut

- Click-through adds `WS_EX_TRANSPARENT` to the chat window, which is always layered. The overlays always ignore the mouse.
- `RegisterHotKey` can't register a modifier key on its own, so the shortcut uses a `WH_KEYBOARD_LL` hook. A lone modifier counts only when it is tapped by itself in under 600 ms, so Alt+Tab and holding Alt are ignored. A key combination is kept from the app it was pressed in.
- The hook pauses while you choose a new shortcut in Settings.

### Rendering a readable translucent window

A Win32 window can only have one opacity, so Nova Chat draws its window in layers. Each overlay is a color-keyed, layered window with `WS_EX_TRANSPARENT | WS_EX_TOOLWINDOW | WS_EX_NOACTIVATE`, placed exactly over the window:

| Layer | Opacity | Draws |
|---|---|---|
| `Form1` | Window opacity (40%) | Background, native controls, hit-testing, resize edges |
| Bubble overlay | Bubble opacity (60%) | Chat bubbles |
| Input overlay | Input box opacity (60%) | The rounded input box |
| Text overlay | 80% | Message text, the prompt text and caret (`PromptTextPainter`), the 🎤 and ➤ icons, the listening status, and the status dot |

The input box's native text and caret are hidden. `PromptTextPainter` redraws them in the text overlay from the edit control's own layout (`EM_POSFROMCHAR`, `EM_GETRECT`), so wrapping, selection, and scrolling match exactly. The window's height is locked to its content through `WM_GETMINMAXINFO`, and `WM_WINDOWPOSCHANGING` keeps it centered across the screen at its alignment (top, center, or bottom).

### Gemma 4 specifics

- `llama-server` is started with **`--jinja`**, so it uses the chat template built into the GGUF. The model card requires this.
- Gemma's template expects the conversation to start with a user turn. The welcome greeting is only shown in the UI and is never sent to the model.
- `CleanOutput()` removes any `<|channel>…<channel|>` thinking blocks and stray `<turn|>` tokens, in case a server passes them through.

## Troubleshooting

| Problem | Fix |
|---|---|
| I can't find the window | Left-click the tray icon to bring it back. If you can't see the icon, check the overflow area (**^**) of the taskbar. |
| Clicks go straight through the window | Click-through is on. Tap **Alt** (or your shortcut), or untick **Click-through** in the tray menu. |
| Tapping Alt interferes with another app | Choose a different shortcut, such as `Ctrl+Alt+T` or `F8`, in **Settings → Shortcut**. |
| The status dot is red: *Can't hide from screen sharing* | Windows refused the request. Hiding needs Windows 10 version 2004 or later. On older builds, the window may appear as a black box in captures. |
| *"Can't listen for speech: ..."* | Check the device in **Settings → Input**, then click **Save** to try again. A device that is unplugged or disabled can't be used. |
| Listening is on but nothing is typed | Make sure the audio plays through the device you selected, and that it contains speech (music and other sounds are ignored). Choosing the spoken language instead of **Detect automatically** can improve accuracy. |
| The speech model download fails | Save **Settings → Input** again to retry, or download `ggml-base.bin` yourself into `%LOCALAPPDATA%\NovaChat\models`. |
| A source is ignored | Check its status on **Settings → Instructions**. Legacy `.doc`/`.ppt`/`.xls` files and scanned PDFs have no readable text, and sources over 12,000 characters in total are cut off. |
| *"This chat couldn't be saved"* | Check that `%LOCALAPPDATA%\NovaChat\chats` can be written to. The chat continues in memory until the app closes. |
| winget setup fails | Setup falls back to GitHub automatically. To skip winget entirely, set `Server.Install.Method` to `GitHub`. |
| The GitHub download is blocked (proxy or firewall) | Download a Windows build from <https://github.com/ggml-org/llama.cpp/releases> yourself, extract it, and set `Server.ExecutablePath` to its `llama-server.exe`. |
| The Visual C++ Runtime prompt was declined | Run setup again and accept the prompt, or install it from <https://aka.ms/vs/17/release/vc_redist.x64.exe>. |
| *"llama-server.exe was not found"* | Restart the app to open setup, or set `Server.ExecutablePath` to the full path of `llama-server.exe`. |
| *"llama-server exited with code …"* | Set `Server.ShowConsoleWindow` to `true` and start the app again to see the error. Common causes: port 8080 is in use, the GGUF file is corrupt (delete it and download again), or the llama.cpp build is too old for Gemma 4 (update it). |
| The model takes a long time to load | Normal on the first start or on an HDD. Increase `Server.StartupTimeoutSeconds` if needed. |
| Replies are very slow | Use a GPU build of llama.cpp (CUDA or Vulkan), choose a smaller quant, or lower `-c`. Large sources also slow down every reply. |
| The model download keeps failing | Choose **Resume**, since the progress is kept. You can also download the file in a browser from the model page and pick it with **I have the model...**. |
| The output contains odd tokens such as `<turn\|>` | Make sure `--jinja` is in `Server.Arguments`. |

## Known Limitations

- **No cancel button for replies.** A reply can't be stopped while it's being generated, except by closing the app.
- **Reply history in-window only.** You can step through earlier replies with the navigation arrows, but there is no full in-app transcript view. Full transcripts are in the JSON files in `%LOCALAPPDATA%\NovaChat\chats`.
- **Chats are saved unencrypted** as plain JSON in your Windows profile.
- **Sources share the context window.** They are limited to 12,000 characters in total and are sent with every message. With an online API, they are sent to that service too.
- **No OCR.** Scanned PDFs and legacy binary Office formats (`.doc`, `.ppt`, `.xls`) can't be read.
- **Screen-share hiding covers software capture only.** It works with apps that capture through Windows. It can't hide the window from a phone camera, a capture card, or another display output.
- **Typing is turned off while speech input is on.** Recognized speech is sent automatically.
- **Sampling settings** (temperature, context length) can only be changed in `appsettings.json`.
- **Text only.** The model can also handle images and audio (with the `mmproj` file), but the app doesn't use that.
- **Windows-only** (WinForms and Win32 APIs), built for x64.
- **Template naming.** The project and namespace are still called `WinFormsApp1`.

## Roadmap

**Shipped**

- [x] Save conversations and switch between them
- [x] Settings window for the model, appearance, input, shortcut, and instructions
- [x] Remember a model file chosen with **I have the model...** across sessions
- [x] Speech input from PC audio or a microphone
- [x] Hide from screen sharing
- [x] Custom instructions and document sources
- [x] Render Markdown in replies, switched from the tray menu
- [x] AI model chaining — up to six models pre-process the reply before the base model
- [x] Show / Hide window global shortcut (separate from click-through)
- [x] In-app update checker — notifies at startup when a new GitHub release is available
- [x] Response source shows the active model name
- [x] Reply navigation — step through earlier replies with arrow buttons and configurable global shortcuts
- [x] Activity tracking, daily digest, and AI intent detection
- [x] Dark theme across every window, dialog, scroll bar, and message box

**Next**

- [ ] Stop-generation button
- [ ] In-app transcript view for past chats, and export as dated diary entries (Markdown)
- [ ] Optional encryption for saved chats
- [ ] Sampling and context-length settings in the Settings window
- [ ] Detect an NVIDIA GPU and offer the CUDA build of llama.cpp
- [ ] Image attachments using the `mmproj` vision projector
- [ ] OCR for scanned PDFs
- [ ] Rename the project and namespace from `WinFormsApp1`

## Responsible Use

- **The model is uncensored.** It won't refuse prompts, so you are responsible for what you ask it and how you use its answers.
- **Listening to PC audio transcribes other people.** Before you transcribe a call, meeting, or video, make sure you have any consent that your local laws require.
- **Hiding from screen sharing is a privacy feature.** It keeps a private assistant out of presentations and recordings. Follow the rules of any meeting, exam, or interview you take part in.

## Contributing

1. Fork the repository and create a branch:
   ```bash
   git checkout -b feature/my-change
   ```
2. Build:
   ```bash
   dotnet build WinFormsApp1.slnx
   ```
   On macOS or Linux, add `-p:EnableWindowsTargeting=true` to check that it compiles.
3. Commit and open a pull request.

Please don't commit `.gguf` model files or build output (`bin/`, `obj/`).

### Releasing a new version

Releases are built by `.github/workflows/build-windows.yml`. The version comes from `<Version>` in `WinFormsApp1/WinFormsApp1.csproj`, and the installer script (`installer/installer.iss`) is given the same version by the workflow.

1. Branch `release-X.Y.Z` from `develop`, set `<Version>X.Y.Z</Version>`, add the notes as `release-notes/vX.Y.Z.md`, and update **What's New** above.
2. Push the branch and run a test build on it:
   ```bash
   gh workflow run build-windows.yml --ref release-X.Y.Z
   ```
   The run's artifact holds the installer and the zip exactly as they would be released.
3. Tag the tested commit and push the tag:
   ```bash
   git tag vX.Y.Z
   git push origin vX.Y.Z
   ```
   The tag build creates the release `vX.Y.Z` here and in [nova-chat-win-releases](https://github.com/lester9080626/nova-chat-win-releases), and copies the installer, `installer/`, and this README to that repository's `main` branch. It needs the `RELEASES_TOKEN` secret: a token with **Contents: Read and write** access to the public repository.

## Acknowledgements

Nova Chat is built on these open-source projects:

- [llama.cpp](https://github.com/ggml-org/llama.cpp): local LLM inference
- [Gemma 4](https://ai.google.dev/gemma) by Google, and the [HauhauCS abliterated build](https://huggingface.co/HauhauCS/Gemma-4-E4B-Uncensored-HauhauCS-Aggressive)
- [whisper.cpp](https://github.com/ggml-org/whisper.cpp) and [Whisper.net](https://github.com/sandrohanea/whisper.net): on-device speech recognition
- [NAudio](https://github.com/naudio/NAudio): WASAPI audio capture
- [WebRtcVadSharp](https://github.com/ladenedge/WebRtcVadSharp): voice activity detection
- [PdfPig](https://github.com/UglyToad/PdfPig): PDF text extraction
- [Markdig](https://github.com/xoofx/markdig): Markdown parsing
