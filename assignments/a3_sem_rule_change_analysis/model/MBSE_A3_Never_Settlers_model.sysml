package Package1 {
	view view1 : StandardViewDefinitions::GeneralView {
		expose 'Autonomous Vehicle';
		expose 'Autonomous Vehicle'::PerceptionSystem;
		expose 'Autonomous Vehicle'::AutonomousControlSystem;
		expose 'Autonomous Vehicle'::VehicleMotionSystem;
		expose 'Autonomous Vehicle'::SafetySystem;
		expose 'Autonomous Vehicle'::ElectricalEnergySystem;
		expose 'Autonomous Vehicle'::VehiclePlatform;
	}
	part def 'Autonomous Vehicle' {
		part PerceptionSystem;
		part AutonomousControlSystem;
		part VehicleMotionSystem;
		part SafetySystem;
		part ElectricalEnergySystem;
		part VehiclePlatform;
	}
}