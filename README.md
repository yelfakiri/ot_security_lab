## OT Security Lab

This project is a modular Operational Technology (OT) security lab designed to simulate realistic industrial network architectures and communication patterns for cybersecurity testing.

The lab focuses on OT-specific constraints and best practices, including strict network segmentation, controlled inter-zone communications, and architectural alignment with the Purdue Model and IEC 62443 (Zones & Conduits) principles.

### Project Status

- Phase 1 – Environment Preparation: Completed  
  Host system preparation, Docker and Docker Compose installation, and clean Git repository initialization.

- Phase 2 – Architecture Design & Project Structuring: Completed  
  Definition of the OT security architecture based on the Purdue Model and IEC 62443, with clear separation between OT, DMZ, and SOC components.

- Phase 3 – Technical Infrastructure & Network Segmentation: Completed  
  Segmented OT networks (Levels 0–1, 2, 3, and Industrial DMZ), dedicated inter-zone router/firewall, and default-deny policy enforced between zones.

The environment now provides a clean, secure, and reproducible foundation for upcoming phases involving OT asset deployment, attack simulation, network-based detection, and SOC-oriented monitoring.
