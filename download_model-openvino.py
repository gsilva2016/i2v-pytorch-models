#!/usr/bin/env python3

import sys
import os
import torchvision
import torch
import torchvision.models as models
import openvino as ov
model_name = os.getenv("MODEL_NAME") 
if model_name != "resnet50":
    print("only resnet50 supported at the moment, selected: {}".format(model_name))
    sys.exit(1)

model = models.resnet50(pretrained=True)
model.eval()
core = ov.Core()
ov_model = ov.convert_model(model, input=[[1,3,224,224]])
ov.save_model(ov_model, f"{model_name}.xml")


