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
    #"https://github.com/ltdrdata/ComfyUI-Manager"
    #"https://github.com/cubiq/ComfyUI_essentials"
)

WORKFLOWS=(
    # Add workflow URLs here (e.g. direct links to .json workflow files)
    # Example:
    # "https://example.com/path/to/workflow.json"
)

CHECKPOINT_MODELS=(
    "https://civitai.com/api/download/models/798204?type=Model&format=SafeTensor&size=full&fp=fp16"
    # Add extra checkpoint model URLs here
    # Example:
    # "https://huggingface.co/.../model.safetensors"
)

UNET_MODELS=(
    # Wan 2.2 diffusion models (UNet)
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"
    # Add extra UNet model URLs here
)

LORA_MODELS=(
    # Wan 2.2 LoRAs
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors"
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors"
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
    # Wan 2.1 VAE
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors"
    # Add extra VAE model URLs here
)

ESRGAN_MODELS=(
    # Add extra ESRGAN / upscaler model URLs here
)

CONTROLNET_MODELS=(
    # Add extra ControlNet model URLs here
)

# Text encoder models (HuggingFace Wan 2.2)
TEXT_ENCODER_MODELS=(
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors"
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
        "${COMFYUI_DIR}/models/lora" \
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
        path="${COMFYUI_DIR}custom_nodes/${dir}"
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
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
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
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif 
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    if [[ -n $auth_token ]];then
        wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    fi
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi