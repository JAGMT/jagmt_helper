# jagmt_helper
This is still in development and receives weekly updates.
<br>
**jagmt_helper** is a RedM native helper designed to simplify your development process. 

## Features
- Easily create prompts with minimal effort.
- Manage and fetch all possible keybinds seamlessly.
- Completely open source & updated weekly.

## Examples
- CreatePrompt --> Creates a keybind prompt
```lua
-- Client Side
exports.jagmt_helper:CreatePrompt("Press E", exports.jagmt_helper:GetKey("E"), vector3(0, 0, 0), function()
    print("Prompt activated!")
end, 3000, 2.0)
```

Enjoy streamlined development with **jagmt_helper**!
