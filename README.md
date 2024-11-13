# xgui

## Setup Instructions

### 1. Load the Script
Copy and paste the following line into your Roblox Executor to load the GUI:
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Xub19/xgui/refs/heads/main/xman.lua"))()
```

### 2. Components Overview
The script automatically creates the following components:
- **`ScreenGui`**: The main container for the GUI.
- **`MainFrame`**: The primary window frame.
- **`TitleBar`**: The top bar containing control buttons.
- **Control Buttons**: 
  - `MinimizeButton`: Minimizes the window.
  - `RestoreButton`: Restores the window to its original size.
  - `CloseButton`: Closes the GUI.
- **`TabFrame`**: Container for tab buttons.
- **`ContentFrame`**: Area for tab content.
- **`ScrollingFrame`**: Scrollable content within the `ContentFrame`.

---

## Customization

### Changing Colors
Modify the `BackgroundColor3` properties in the script to customize colors. For example:
```lua
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Change main frame color
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Change title bar color
```

### Adding Tabs
To add more tabs:
1. Duplicate the `TabButton1` section in the script.
2. Change the `Name` and `Text` properties to match the new tab.
3. Link new tab functionality by adding event handlers.

Example:
```lua
local TabButton2 = Instance.new("TextButton")
TabButton2.Name = "TabButton2"
TabButton2.Text = "Tab 2"
TabButton2.Size = UDim2.new(0, 100, 1, 0)
TabButton2.Parent = TabFrame
```

### Adding Content
Add new UI elements to the `ContentFrame` or its child, `ScrollingFrame`, to populate the GUI with additional content.

---

## Controls

| Action             | Description                                |
|--------------------|--------------------------------------------|
| **Drag TitleBar**  | Moves the window.                         |
| **Minimize Button**| Shrinks the window to the title bar size.  |
| **Restore Button** | Restores the window to full size.          |
| **Close Button**   | Closes the GUI entirely.                  |

---

## Example Script Usage
Here’s how you can extend the script:
```lua
local Button = Instance.new("TextButton")
Button.Text = "New Button"
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Parent = ListFrame

Button.MouseButton1Click:Connect(function()
    print("Button clicked!")
end)
```

---

### Notes
- This script is intended for educational purposes. Use responsibly.
- For any issues or customizations, feel free to contact the developer.

Enjoy creating with ModernGUI!
