# FYP: Smart Stethoscope

## Overview
Cardiovascular disorders affect around 19 million people worldwide, according to the World Health Organization. The most common symptom of these disorders is irregular heartbeats, which can be triggered by various physical, emotional, and environmental factors. Without proper care and regular follow-ups, these conditions can become life-threatening.

### The Problem
- Many individuals lack the knowledge to record heartbeats accurately using a standard stethoscope.
- Even those who can record heartbeats often struggle to differentiate between normal and irregular rhythms.
- The need for frequent doctor visits for monitoring and communication can be inconvenient and time-consuming.

### The Solution: Smart Stethoscope
**Smart Stethoscope** is an innovative solution that leverages Deep Learning to offer a seamless heartbeat recording and classification system. 

## Features
- **Heartbeat Recording**: The Smart Stethoscope device records heartbeats easily and efficiently, eliminating the need for specialized knowledge.
- **Deep Learning Classification**: Utilizing YAMNet, a Deep Neural Network, the system classifies heartbeats into normal and abnormal categories.

## How It Works

### 1. Device Design & Execution
- **Stethoscope Modification**: An existing laboratory stethoscope is modified using a microphone and a microcontroller unit (MCU) to record heartbeats.

### 2. Deep Learning Model
- **Model Training**: The classification model is trained on YAMNet, a state-of-the-art Deep Neural Network, using publicly available datasets.

### 3. Mobile Application
- **Classification**: The trained YAMNet model is deployed on device for classification of the recorded heartbeats.
