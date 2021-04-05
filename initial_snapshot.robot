# Take initial snapshot of the operational state of the device
# and save the output to a file

*** Settings ***
# Importing test libraries, resource files and variable files.
Library        genie.libs.robot.GenieRobot
Library        pyats.robot.pyATSRobot


*** Variables ***
# Define the pyATS testbed file to use for this run
${testbed}     testsmdvc.yaml 

*** Test Cases ***
# Creating test cases from available keywords.

Connect
    # Initializes the pyATS/Genie Testbed
    use genie testbed "${testbed}"

    # Connect to both device
    connect to device "dist-rtr01"
    connect to device "dist-sw01"

Profile the devices
    Profile the system for "bgp;config;interface;platform;ospf;arp;vrf;vlan" on devices "dist-rtr01;dist-sw01" as "./good/good_snapshot"
