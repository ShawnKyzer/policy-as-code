# Policy-based Access Control (PBAC) for a Pharmaceutical Company

# -------------------------------------

#

# This example implements PBAC for a Pharmaceutical Company's API. The API allows

# users to access patient records, prescription data, and clinical trial results.

# The policy controls which users can perform actions on which resources based on

# policies defined using attributes of users, resources, and actions, as well as

# additional conditions such as time and resource sensitivity.

#

# This example shows how to:

#

# * Implement PBAC using Rego that leverages external data.

# * Define policies based on multiple attributes and conditions.

package app.pbac

import rego.v1

default allow := false

# Policy: Doctors can read and update patient records during working hours

allow if {
	data.user_attributes[input.user].role == "doctor"
	data.user_attributes[input.user].clearance_level >= data.resource_attributes[input.resource].sensitivity_level
	input.action == "read"
	input.resource_type == "patient_record"
	time.now_ns() >= time.parse_rfc3339_ns("2024-03-18T09:00:00Z")
	time.now_ns() <= time.parse_rfc3339_ns("2024-03-18T17:00:00Z")
}

allow if {
	data.user_attributes[input.user].role == "doctor"
	data.user_attributes[input.user].clearance_level >= data.resource_attributes[input.resource].sensitivity_level
	input.action == "update"
	input.resource_type == "patient_record"
	time.now_ns() >= time.parse_rfc3339_ns("2024-03-18T09:00:00Z")
	time.now_ns() <= time.parse_rfc3339_ns("2024-03-18T17:00:00Z")
}

# Policy: Pharmacists can read non-sensitive prescription data

allow if {
	data.user_attributes[input.user].role == "pharmacist"
	data.resource_attributes[input.resource].sensitivity_level < 3
	input.action == "read"
	input.resource_type == "prescription"
}

# Policy: Researchers can read anonymized clinical trial results

allow if {
	data.user_attributes[input.user].role == "researcher"
	data.resource_attributes[input.resource].anonymized == true
	input.action == "read"
	input.resource_type == "clinical_trial_result"
}

# Policy: Senior administrators can perform any action on any resource

allow if {
	data.user_attributes[input.user].role == "admin"
	data.user_attributes[input.user].seniority_level >= 5
}
