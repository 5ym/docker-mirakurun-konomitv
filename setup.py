import yaml

with open("/code/config.example.yaml", "r") as yf:
    data = yaml.safe_load(yf)
    data['general']['backend'] = 'Mirakurun'
    data['general']['mirakurun_url'] = 'http://mirakurun:40772/'
    data['general']['encoder'] = 'FFmpeg'
    data['capture']['upload_folder'] = '/capture'
    print(data)
    with open('/code/config.yaml', 'w') as file:
        yaml.dump(data, file)
