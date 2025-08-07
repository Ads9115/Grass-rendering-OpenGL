# High-Performance Grass Renderer (C++ & OpenGL)

A real-time grass rendering engine built from scratch in C++ using modern OpenGL. This project efficiently renders **10,000+ animated grass blades** in a dynamic outdoor environment by utilizing **GPU instancing**, **shader-based animation**, and **efficient data structures**.

[![Demo Video](https://img.youtube.com/vi/f18c91YjxJQ/0.jpg)](https://youtu.be/f18c91YjxJQ)

---

##  Features

- **🚀 GPU Instancing**  
  Render tens of thousands of grass blades with a single draw call using `glDrawElementsInstanced`.

- **🌬️ Procedural Wind Animation**  
  Realistic grass swaying motion calculated entirely in the vertex shader using sine wave functions.

- **🌱 Natural Variety**  
  Each blade has randomized height, position, and rotation for a more organic look.

- **💡 Blinn-Phong Lighting**  
  Includes ambient, diffuse, and specular components with a directional light source.

- **🌌 Skybox Environment**  
  A cubemap-based skybox wraps the entire scene in a realistic environment.

- **🎮 First-Person Camera**  
  WASD movement and mouse-based look control for exploring the field interactively.

---

## Core Concepts

### 1. Offloading Work to the GPU  
All blades share one geometry and are rendered using a large buffer of transformation matrices on the GPU, removing costly per-object CPU logic.

### 2. Shader-Based Visual Detail  
All visuals—blade shape, lighting, swaying, and color—are defined procedurally in the vertex and fragment shaders, allowing minimal geometry usage.

---

##  File Structure

├── main.cpp # Entry point with OpenGL setup and main loop
├── Shader.h / Shader.cpp # Shader loading, compiling, and management
├── Camera.h / Camera.cpp # First-person camera system
├── default.vert / default.frag # Grass blade shaders
├── ground.vert / ground.frag # Ground plane shaders
├── skybox.vert / skybox.frag # Skybox shaders
├── /skybox/ # Six images for cubemap (right, left, top, bottom, front, back)


---

## 🛠️ Dependencies

Ensure the following libraries are available and correctly configured:

- [GLFW](https://www.glfw.org/) — Window/context creation and input handling  
- [GLAD](https://glad.dav1d.de/) — OpenGL function loader  
- [GLM](https://github.com/g-truc/glm) — Vector and matrix operations  
- [stb_image](https://github.com/nothings/stb) — Image loading for skybox textures

---

## 🧰 Build Instructions

1. **Setup Libraries**:  
   Make sure GLFW, GLAD, GLM, and stb_image are installed or available in your project directory.

2. **Include Directories**:  
   In your IDE (e.g., Visual Studio), add include paths for:
include/
include/GLFW/
include/glad/
include/glm/


3. **Link Libraries**:  
Add the following to your linker settings:



4. **Compile**:  
Build `main.cpp`.

5. **Run**:  
Place the following in the same directory as your `.exe`:
- `/skybox/` folder with 6 cubemap textures  
- All `.vert` and `.frag` shader files

---

## 🎮 Controls

| Action        | Input                |
|---------------|----------------------|
| Move          | `W` `A` `S` `D` keys |
| Look Around   | Mouse movement       |
| Zoom In/Out   | Mouse scroll wheel   |
| Exit Program  | `ESC`                |

---

## 📷 Demo Video

[![Watch the Demo](https://img.youtube.com/vi/f18c91YjxJQ/0.jpg)](https://youtu.be/f18c91YjxJQ)

> *Click the image above to watch a video demonstration of the renderer in action.*

---

## 🙏 Acknowledgements

- Skybox textures provided by [LearnOpenGL](https://learnopengl.com/).  
- Built using principles and best practices from modern OpenGL tutorials and documentation.

---

## 📜 License

This project is open-source and available under the MIT License.


