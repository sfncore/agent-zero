import json
import os

try:
    with open('tmp/settings.json', 'r') as f:
        data = json.load(f)
        print("util_model_provider:", data.get("util_model_provider"))
        print("util_model_name:", data.get("util_model_name"))
        print("util_model_api_base:", data.get("util_model_api_base"))
        print("chat_model_provider:", data.get("chat_model_provider"))
        print("chat_model_name:", data.get("chat_model_name"))
        print("chat_model_api_base:", data.get("chat_model_api_base"))
except Exception as e:
    print(e)
