import json

try:
    with open('/Users/mapernia/Projects/repka-arts/config/settings_schema.json', 'r') as f:
        data = json.load(f)
    print("JSON is valid.")
except json.JSONDecodeError as e:
    print(f"JSON Decode Error: {e}")
except Exception as e:
    print(f"Error: {e}")
