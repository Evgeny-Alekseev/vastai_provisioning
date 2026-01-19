#!/bin/bash

source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/gseth/ControlAltAI-Nodes"
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes"
    "https://github.com/numz/ComfyUI-SeedVR2_VideoUpscaler"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/chflame163/ComfyUI_LayerStyle"
    "https://github.com/city96/ComfyUI-GGUF"
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    #"https://github.com/ltdrdata/ComfyUI-Manager"
    #"https://github.com/cubiq/ComfyUI_essentials"
)

WORKFLOWS=(
    # Add workflow URLs here (e.g. direct links to .json workflow files)
    # Example:
    # "https://example.com/path/to/workflow.json"

  # my_workflow directory
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/my_workflow/1-mywan22FLF.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/my_workflow/video_wan2_2_14B_flf2v_3lorasnew8.json"
  
  # others directory
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/ComfyUI-Wan-2.2-FLF2V.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/DaSiWa%20WAN%202.2%20i2v%20FastFidelity%20C-AiO-33.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/DaSiWa%20WAN%202.2%20i2v%20FastFidelity%20C-EX-14.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/DaSiWa%20WAN%202.2%20i2v%20FastFidelity%20C-FLF2V-13.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/DaSiWa%20WAN%202.2%20i2v%20FastFidelity%20C-I2V-13.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/DaSiWa%20WAN%202.2%20i2v%20FastFidelity%20C-SVI-14.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Daxamur_WAN22_FLF2V_12.1.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Daxamur_WAN22_I2V_12.1.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Daxamur_WAN22_I2V_131.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Face%20swap%20openart.ai.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/WAN2.2%20T2V-I2V-T2I-S2V%20K3NK%20v2.5.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Wan-2.2-VACE.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Wan2.2%2BRemix%2BI2V%2Bv2.1%2B%2BSVI2Pro%2B.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Wan2.2-Remix-I2V-Comfy-Qwen3.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Wan2.2-Remix-comfy-i2v-workflow.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Wan2.2-Remix-comfy-t2v-workflow.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Wan2.2-Remix-kijai-t2v-workflow.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/Wan22-I2V-Remix.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/background_generation_workflow.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/faceswap.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/qwen2512_.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/rmbg2openart.ai.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/wan2.2-flf2v-rapid-aio-example.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/workflow-remove-background-openart.ai.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/others/workflow_faceswap.json"
  
  # presets_smyshnikov/qwen directory
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Loras/Multiple-Angles/multiple%20angles%20clownshark.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Loras/Multiple-Angles/multiple%20angles%20generator.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Loras/Multiple-Angles/multiple%20angles%20original.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Loras/Next-Scene/next-scene-v2%20Generate.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Loras/Next-Scene/next-scene-v2%20InputImage.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Loras/Qwen+Edit2509+Multi-Angles+NextScene%20ClownShark.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Loras/Qwen+Edit2509+Multi-Angles+NextScene.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/bf16/Qwen%20Edit%202509%20bf16.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/bf16/Qwen%20Edit%20bf16.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/bf16/Qwen%20Edit%20Inpaint%20bf16.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/bf16/Qwen%20Edit%20Ratio%202%20person(objects)%20bf16.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/bf16/Qwen%20Edit%20Ratio%203%20person(objects)%20bf16.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/bf16/Qwen%20Edit%20Ratio%20bf16.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/Grid_Img_Creator.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/Qwen%20Edit%20Inpaint%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/Qwen%20Edit%20Ratio%202%20person(objects)%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/Qwen%20Edit%20Ratio%203%20person(objects)%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/Qwen%20Edit%20Ratio%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit/Qwen%20Edit%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit-2509/Qwen%20Edit%202509%20Inpaint%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit-2509/Qwen_Edit_2509.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit-2509/Qwen_Edit_2509_ControlNet.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit-2511/1.%20Qwen_Edit_2511%20multiref.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit-2511/2.%20Qwen_Edit_2511%20multiref%20+%20Upscale.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit-2511/3.%20Qwen_Edit_2511%20multiref%20+%20Controlnet%20+%20Upscale.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit-2511/Qwen%20Edit%202511%20Auto%20Scenes.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Edit-2511/Qwen_Edit_2511%201img.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Image/Qwen%20Image%20BF16.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Qwen-Image/Qwen%20Image.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Loras/Qwen+Edit2509+Multi-Angles+NextScene%20ClownShark.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/qwen/Loras/Qwen+Edit2509+Multi-Angles+NextScene.json"
  
  # presets_smyshnikov/snippets directory
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/snippets/ControlNet/InstantX-ControlNet.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/snippets/Grid_Img_Creator.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/snippets/Prompting/Camera%20Control%20Prompt%20Generator.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/snippets/Prompting/Florence2%20Prompting.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/snippets/Prompting/Qwen3VL%20Prompting.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/snippets/Upscale/SeedVR%20Upscale.json"
  
  # presets_smyshnikov/wan directory
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/Animate/Wan_Animate_Enhance_Black.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/Animate/Wan_Animate_not_completed.gguf.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/Animate/Wan_Animate_Smyshnikov_Black.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/Animate/Wan_Animate_Smyshnikov_Original.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/FLF/WAN%202.2%20FLF2V%20Florence2.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/I2V/WAN%202.2%20FaceEnhance%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/I2V/WAN%202.2%20I2V%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/I2V/Wan%20T2I%20Florence%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/T2I/Wan%20T2I%20Florence%20Smyshnikov.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/T2I/WAN_2.2_T2I_Low_Smyshnikov_black.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/wan/T2V/Wan%202.2%20T2V_Smyshnikov.json"
  
  # presets_smyshnikov/zit directory
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/zit/batch/Z-Image%20Batch.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/zit/batch/Z-Image-Face%20Detailer%20Batch.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/zit/Florence2%20Prompting.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/zit/Florence2_BatchPromptingV2.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/zit/Qwen3VL%20Prompting.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/zit/Z-Image.json"
  "https://raw.githubusercontent.com/Evgeny-Alekseev/vastai_provisioning/main/presets_smyshnikov/zit/Z-Image-Face%20Detailer.json"
)


CHECKPOINT_MODELS=(
    "https://civitai.com/api/download/models/798204?type=Model&format=SafeTensor&size=full&fp=fp16"
    # Add extra checkpoint model URLs here
    # Example:
    # "https://huggingface.co/.../model.safetensors"
)

UNET_MODELS=(
   
    # Qwen Image Edit 2511 diffusion models
    "https://huggingface.co/lightx2v/Qwen-Image-Edit-2511-Lightning/resolve/main/qwen_image_edit_2511_fp8_e4m3fn_scaled_lightning.safetensors"
    "https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2511_fp8mixed.safetensors"
    "https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2511_bf16.safetensors"
    # Add extra UNet model URLs here
)

LORA_MODELS=(
    
    # Qwen Image Edit 2511 LoRAs
    "https://huggingface.co/lightx2v/Qwen-Image-Edit-2511-Lightning/resolve/main/Qwen-Image-Edit-2511-Lightning-4steps-V1.0-fp32.safetensors"
    "https://huggingface.co/DiffSynth-Studio/Qwen-Image-Edit-F2P/resolve/main/edit_0928_lora_step40000.safetensors"
    # WAN 2.2 Anime Cumshot Aesthetics (Civitai)
    # Aesthetics_low
    "https://civitai.com/api/download/models/2116027?type=Model&format=SafeTensor"
    # Aesthetics_high
    "https://civitai.com/api/download/models/2116008?type=Model&format=SafeTensor"
    # (wan 2.2 experimental) WAN General NSFW model - Wan Video 2.2 I2V-A14B
    # generalnsfw_low
    "https://civitai.com/api/download/models/2083303?type=Model&format=SafeTensor"
    # generalnsfw_high
    "https://civitai.com/api/download/models/2073605?type=Model&format=SafeTensor"
    # WAN DR34M15H - Multi-perspective Missionary (POV+)
    "https://civitai.com/api/download/models/1975021?type=Model&format=SafeTensor"
    # WAN DR34ML4Y - All-In-One NSFW Wan Video 2.2 I2V-A14B
    # DR34ML4Y_low
    "https://civitai.com/api/download/models/2553271?type=Model&format=SafeTensor"
    # DR34ML4Y_high
    "https://civitai.com/api/download/models/2553151?type=Model&format=SafeTensor"
    # F4C3SPL4SH Cumshot - I2V Wan 2.2 Video LoRa - K3NK
    # F4C3SPL4SHlow
    "https://civitai.com/api/download/models/2178869?type=Model&format=SafeTensor"
    # F4C3SPL4SHhigh
    "https://civitai.com/api/download/models/2176450?type=Model&format=SafeTensor"
    # Cum/Facial - Wan2.2 Wan Video 2.2 I2V-A14B
    # Cumfaciallow
    "https://civitai.com/api/download/models/2460428?type=Model&format=SafeTensor"
    # Cumfacialhigh
    "https://civitai.com/api/download/models/2460386?type=Model&format=SafeTensor"
    # K3NK 4llinOne - NSFW Helper - Wan 2.2 Video LoRa - K3NK
    # 4llinOnelow
    "https://civitai.com/api/download/models/2538990?type=Model&format=SafeTensor"
    # 4llinOnehigh
    "https://civitai.com/api/download/models/2484657?type=Model&format=SafeTensor"
    # (Wan 2.2) Male finishing [Anime]
    # Finishinglow
    "https://civitai.com/api/download/models/2579518?type=Model&format=SafeTensor"
    # Finishinghigh
    "https://civitai.com/api/download/models/2579567?type=Model&format=SafeTensor"
    # WAN 2.2 I2V - POV Body Cumshot & Pullout
    # Pulloutlow
    "https://civitai.com/api/download/models/2298928?type=Model&format=SafeTensor"
    # Pullouthigh
    "https://civitai.com/api/download/models/2298673?type=Model&format=SafeTensor"
    # WAN 2.2 I2V - Orgasm / O-face
    # Ofacelow
    "https://civitai.com/api/download/models/2187757?type=Model&format=SafeTensor"
    # Ofacehigh
    "https://civitai.com/api/download/models/2187729?type=Model&format=SafeTensor"
    # Orgasm LoRAs from civitaiarchive.com (no auth)
    # orgasm_low
    "https://civitaiarchive.com/api/download/models/2054796"
    # orgasm_high
    "https://civitaiarchive.com/api/download/models/2373145"
    # ultimateBJ (Playtime-AI, HuggingFace)
    # ultimateBJ_low
    "https://huggingface.co/Playtime-AI/Wan2.2-Loras/resolve/main/Wan2.2%20-%20I2V%20-%20Blowjob%20-%20LOW%2014B.safetensors"
    # ultimateBJ_high
    "https://huggingface.co/Playtime-AI/Wan2.2-Loras/resolve/main/Wan2.2%20-%20I2V%20-%20Blowjob%20-%20HIGH%2014B.safetensors"
    # Add extra LoRA model URLs here
    # Example:
    # "https://civitai.com/api/download/models/..."
)

VAE_MODELS=(
   
    "https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors"
    # Add extra VAE model URLs here
)

ESRGAN_MODELS=(
    # Add extra ESRGAN / upscaler model URLs here
)

CONTROLNET_MODELS=(
    # Qwen Image InstantX ControlNet
    "https://huggingface.co/Comfy-Org/Qwen-Image-InstantX-ControlNets/resolve/main/split_files/controlnet/Qwen-Image-InstantX-ControlNet-Union.safetensors"
    # Add extra ControlNet model URLs here
)

# GGUF models
GGUF_MODELS=(
    # Qwen Image Edit 2511 GGUF model
    "https://huggingface.co/unsloth/Qwen-Image-Edit-2511-GGUF/blob/main/qwen-image-edit-2511-Q8_0.gguf"
    # Add extra GGUF model URLs here
)

# Text encoder models (HuggingFace Wan 2.2)
TEXT_ENCODER_MODELS=(
   
    # Qwen Image text encoders
    "https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors"
    "https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b.safetensors"
)

# HuggingFace repos that require authentication (use HF_TOKEN)
# Add repo names here (e.g., "Comfy-Org/Wan_2.2_ComfyUI_Repackaged")
# All other HF repos will download anonymously
HF_AUTH_REPOS=(
    "Comfy-Org/Wan_2.2_ComfyUI_Repackaged"
    "Playtime-AI/Wan2.2-Loras"
    # Add other private/gated HF repos here if needed
    # Example:
    # "SomeOrg/PrivateModel"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_files \
        "${COMFYUI_DIR}/user/default/workflows" \
        "${WORKFLOWS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/text_encoders" \
        "${TEXT_ENCODER_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/loras" \
        "${LORA_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/gguf" \
        "${GGUF_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip install --no-cache-dir ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip install --no-cache-dir -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip install --no-cache-dir -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    base_dir="$1"
    mkdir -p "$base_dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$base_dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        
        # Extract subdirectory structure from URL for workflows
        if [[ "$base_dir" == *"workflows"* ]]; then
            # Extract path after domain for workflows
            path_part=$(echo "$url" | sed 's|https://[^/]*/||' | sed 's|^[^/]*/||')
            # Remove URL encoding and extract directory path
            dir_path=$(dirname "$path_part" | sed 's/%20/ /g')
            # Create full directory path
            if [[ "$dir_path" != "." ]]; then
                target_dir="${base_dir}/${dir_path}"
                mkdir -p "$target_dir"
            else
                target_dir="$base_dir"
            fi
        else
            target_dir="$base_dir"
        fi
        
        provisioning_download "${url}" "${target_dir}"
        printf "\n"
    done
}

# Download a HuggingFace file using Python requests.
# Important: requests does NOT forward Authorization header to redirected hosts by default,
# which avoids 401s from HF CAS/Xet redirect hosts.
function provisioning_download_hf_with_python() {
    local url="$1"
    local dir="$2"
    local dotbytes="${3:-4M}"

    python - <<'PY' "$url" "$dir"
import os
import sys
from pathlib import Path
from urllib.parse import unquote

import requests

url = sys.argv[1]
out_dir = Path(sys.argv[2])
out_dir.mkdir(parents=True, exist_ok=True)

hf_token = os.environ.get("HF_TOKEN", "")
headers = {}
if hf_token:
    headers["Authorization"] = f"Bearer {hf_token}"

def decode_filename_from_cd(cd_header: str) -> str | None:
    if not cd_header:
        return None
    parts = [p.strip() for p in cd_header.split(";")]
    filename_star = None
    filename_regular = None
    for part in parts:
        lower = part.lower()
        if lower.startswith("filename*="):
            filename_star = part.split("=", 1)[1].strip().strip('"').strip("'")
        elif lower.startswith("filename=") and not lower.startswith("filename*="):
            filename_regular = part.split("=", 1)[1].strip().strip('"').strip("'")
    # RFC 5987 filename*
    if filename_star:
        if "''" in filename_star:
            _, value = filename_star.split("''", 1)
        else:
            value = filename_star
        name = value
        while "%" in name:
            decoded = unquote(name)
            if decoded == name:
                break
            name = decoded
        return name
    if filename_regular:
        name = filename_regular
        while "%" in name:
            decoded = unquote(name)
            if decoded == name:
                break
            name = decoded
        return name
    return None

# Stream download; allow redirects. Requests will not forward Authorization to a different host.
with requests.get(url, headers=headers, stream=True, allow_redirects=True, timeout=60) as r:
    r.raise_for_status()

    cd = r.headers.get("content-disposition", "")
    filename = decode_filename_from_cd(cd)

    if not filename:
        # fall back to URL path
        path_part = url.split("?", 1)[0]
        filename = os.path.basename(path_part) or "download.bin"
        # decode %20 etc.
        while "%" in filename:
            decoded = unquote(filename)
            if decoded == filename:
                break
            filename = decoded

    out_path = out_dir / filename
    if out_path.exists():
        print(f"File exists, skipping: {out_path}")
        sys.exit(0)

    tmp_path = out_path.with_suffix(out_path.suffix + ".part")
    written = 0
    with open(tmp_path, "wb") as f:
        for chunk in r.iter_content(chunk_size=1024 * 1024):
            if not chunk:
                continue
            f.write(chunk)
            written += len(chunk)

    tmp_path.replace(out_path)
    print(f"Saved: {out_path} ({written} bytes)")
PY
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    local url="$1"
    local dir="$2"
    local dotbytes="${3:-4M}"
    local wget_args=()

    # HuggingFace auth: only for specific repos listed in HF_AUTH_REPOS
    if [[ -n $HF_TOKEN && $url =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        local needs_auth=false
        for repo in "${HF_AUTH_REPOS[@]}"; do
            if [[ "$url" == *"/${repo}/"* ]]; then
                needs_auth=true
                break
            fi
        done
        
        if [[ "$needs_auth" == true ]]; then
            # Use Python requests for HF auth downloads to avoid leaking Authorization header
            # to HF CAS/Xet redirect hosts (which can return 401).
            provisioning_download_hf_with_python "$url" "$dir" "$dotbytes"
            return 0
        fi
        # Otherwise download anonymously (no auth header) - works for public repos
    # Civitai auth: use token in query string ONLY, no Authorization header
    elif [[ -n $CIVITAI_TOKEN && $url =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        # Append ?token=... so initial civitai.com request is authenticated,
        # but we don't leak Authorization header to the R2 redirect host (which can cause 400s).
        if [[ "$url" != *"token="* ]]; then
            if [[ "$url" == *"?"* ]]; then
                url="${url}&token=${CIVITAI_TOKEN}"
            else
                url="${url}?token=${CIVITAI_TOKEN}"
            fi
        fi
    fi

    # Build wget command with optional auth header
    wget "${wget_args[@]}" \
        --no-clobber \
        --content-disposition \
        --show-progress \
        --retry-on-http-error=403,404,429,500,502,503,504 \
        --tries=3 \
        --timeout=30 \
        -e dotbytes="${dotbytes}" \
        -P "$dir" \
        "$url"
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start

fi
