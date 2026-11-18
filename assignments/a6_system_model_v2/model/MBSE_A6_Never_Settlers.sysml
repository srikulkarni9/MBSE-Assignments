package NeverSettlersA6 {
    doc /* MBSE4B A6, working system requirements baseline v1.0, 18 November 2026.
       Target: 2027 Shell Eco-marathon Autonomous Driving Competition (ADC).
       A3's six logical parts are retained. Battery Electric is a working assumption.
       Vehicle category and event are open. Allocations describe design intent.
       Sources: A3 model export; A4 report; Session 5 slides 26, 31, 40, 46, 47, 52;
       2027 SEM Chapter I and Chapter IV. I and IV mean those season's chapters. */

    package StakeholderExpectations {
        concern def <'N-01'> DemonstrateAutonomousVehicle {
            doc /* Demonstrate a safe, autonomous and energy-efficient run on a defined SEM 2027 course. Source: A4 section 1. */
        }
        action def <'G-01'> GainCompetitionAdmission;
        dependency from GainCompetitionAdmission to DemonstrateAutonomousVehicle;
        action def <'G-02'> DriveAutonomously;
        dependency from DriveAutonomously to DemonstrateAutonomousVehicle;
        action def <'G-03'> ProtectPeople;
        dependency from ProtectPeople to DemonstrateAutonomousVehicle;
        action def <'G-04'> UseEnergyEfficiently;
        dependency from UseEnergyEfficiently to DemonstrateAutonomousVehicle;
        action def <'G-05'> CommunicateEngineering;
        dependency from CommunicateEngineering to DemonstrateAutonomousVehicle;
        action def <'G-06'> DemonstrateMBSEPractice;
        dependency from DemonstrateMBSEPractice to DemonstrateAutonomousVehicle;
        action def <'G-07'> SustainCompliance;
        dependency from SustainCompliance to DemonstrateAutonomousVehicle;
        requirement def <'O-01'> PassInspectionFirstTime {
            doc /* Pass all inspection items on first presentation. A4 initial target. */
        }
        dependency from PassInspectionFirstTime to GainCompetitionAdmission;
        requirement def <'O-02'> CompleteAllSectors {
            doc /* Complete all sectors in Autonomous State in at least one valid attempt. Rule basis updated to 2027 Chapter IV Arts. 406b-d, 407e and 415a. */
        }
        dependency from CompleteAllSectors to DriveAutonomously;
        requirement def <'O-03'> ReliableAutonomy {
            doc /* Complete five consecutive full-course test runs without unplanned disengagement. A4 initial target. */
        }
        dependency from ReliableAutonomy to DriveAutonomously;
        requirement def <'O-04'> ZeroSafetyInfractions {
            doc /* Record zero safety-related infractions during the event. */
        }
        dependency from ZeroSafetyInfractions to ProtectPeople;
        requirement def <'O-05'> CompetitiveEfficiency {
            doc /* Place in the better half of ADC entries of the same vehicle category and energy class. A4 initial target. */
        }
        dependency from CompetitiveEfficiency to UseEnergyEfficiently;
        requirement def <'O-06'> DeliverBusinessPresentation {
            doc /* Submit the PDF before the On-Track Challenge and use at most four presenters. 2027 Chapter IV Art. 414f-g. */
        }
        dependency from DeliverBusinessPresentation to CommunicateEngineering;
        requirement def <'O-07'> TraceableRequirements {
            doc /* By Project Review 1, trace every system requirement to its parent and allocation and identify a verification method. */
        }
        dependency from TraceableRequirements to DemonstrateMBSEPractice;
        requirement def <'O-08'> RuleChangeImpactControl {
            doc /* Assess rule-change impact within five working days. A4 initial target. */
        }
        dependency from RuleChangeImpactControl to SustainCompliance;
    }

    package Exchanges {
        private import ScalarValues::*;

        item def CourseCues {
            doc /* Boundaries, signs, stop lines, obstacles and start/finish markings. */
        }
        item def StartSignal;
        item def HandDeviceStates {
            attribute leftActive : Boolean;
            attribute rightActive : Boolean;
        }
        item def ManualControlInput;
        item def EmergencyShutdownRequest;
        item def VehicleMotion;
        item def RoadCondition;
        item def ChargingEnergy;
        item def ElectricalPower;
        item def ElectricalEnergyRecord;
        item def SceneEstimate;
        item def MotionPlan;
        item def MotionCommand;
        item def VehicleFeedback;
        item def AutonomyRelease;
        item def IsolationCommand;
        item def PropulsionIsolation;
        enum def AuthorityKind {
            enum manual;
            enum autonomous;
            enum emergencyIsolated;
        }
        item def ControlAuthority {
            attribute mode : AuthorityKind;
        }
        item def AutonomousIndication { attribute lampOn : Boolean; }
        item def OrganiserContact { attribute closed : Boolean; }

        port def CourseInput { in item cues : CourseCues; }
        port def StartInput { in item signal : StartSignal; }
        port def HandInput { in item devices : HandDeviceStates; }
        port def ManualInput { in item control : ManualControlInput; }
        port def ShutdownInput { in item request : EmergencyShutdownRequest; }
        port def RoadExchange {
            in item conditions : RoadCondition;
            out item motion : VehicleMotion;
        }
        port def ChargeInput { in item transfer : ChargingEnergy; }
        port def IndicatorOutput { out item indication : AutonomousIndication; }
        port def ContactOutput { out item contact : OrganiserContact; }
        port def SceneOutput { out item scene : SceneEstimate; }
        port def MotionOutput { out item command : MotionCommand; }
        port def FeedbackOutput { out item feedback : VehicleFeedback; }
        port def ReleaseOutput { out item release : AutonomyRelease; }
        port def IsolationOutput { out item isolation : IsolationCommand; }
        port def IsolatedOutput { out item status : PropulsionIsolation; }
        port def AuthorityOutput { out item authority : ControlAuthority; }
        port def PowerOutput { out item power : ElectricalPower; }
        port def EnergyRecordOutput { out item record : ElectricalEnergyRecord; }
    }

    package LogicalModel {
        private import Exchanges::*;

        part def VehicleBoundary {
            doc /* System of interest: the vehicle in its ADC configuration. The driver is
               a human actor outside the system boundary and physically on board. */
            port course : CourseInput;
            port startCommand : StartInput;
            port hands : HandInput;
            port manualControls : ManualInput;
            port driverShutdown : ShutdownInput;
            port externalShutdown : ShutdownInput;
            port road : RoadExchange;
            port charge : ChargeInput;
            port lamp : IndicatorOutput;
            port organiserStatus : ContactOutput;
        }
        part def SafetyDriver {
            port hands : ~HandInput;
            port controls : ~ManualInput;
            port shutdown : ~ShutdownInput;
        }
        part def CompetitionOfficials {
            port startCommand : ~StartInput;
            port shutdown : ~ShutdownInput;
            port observeLamp : ~IndicatorOutput;
            port receiveStatus : ~ContactOutput;
        }
        part def CompetitionCourse {
            port cues : ~CourseInput;
            port road : ~RoadExchange;
        }
        part def ChargingEquipment {
            port charge : ~ChargeInput;
        }
        part def ProjectTeam;

        part def Perception {
            port course : CourseInput;
            port scene : SceneOutput;
            port motionFeedback : ~FeedbackOutput;
        }
        part def AutonomousControl {
            doc /* Logical home of the ICS. The ICS owns the driving decisions,
               Autonomous State and external state reporting. */
            port scene : ~SceneOutput;
            port startCommand : StartInput;
            port release : ~ReleaseOutput;
            port emergencyStatus : ~IsolatedOutput;
            port motionFeedback : ~FeedbackOutput;
            port power : ~PowerOutput;
            port motionCommand : MotionOutput;
            port authority : AuthorityOutput;
            port lamp : IndicatorOutput;
            port organiserStatus : ContactOutput;
        }
        part def VehicleMotionControl {
            port autonomousCommand : ~MotionOutput;
            port authority : ~AuthorityOutput;
            port manualControls : ManualInput;
            port power : ~PowerOutput;
            port road : RoadExchange;
            port feedback : FeedbackOutput;
        }
        part def SafetyMonitoring {
            port handDevices : HandInput;
            port driverControlInput : ManualInput;
            port driverShutdown : ShutdownInput;
            port externalShutdown : ShutdownInput;
            port release : ReleaseOutput;
            port isolation : IsolationOutput;
        }
        part def ElectricalEnergy {
            port charge : ChargeInput;
            port isolation : ~IsolationOutput;
            port isolationStatus : IsolatedOutput;
            port icsPower : PowerOutput;
            port motionPower : PowerOutput;
            port energyUsed : EnergyRecordOutput;
        }
        part def VehicleStructure {
            doc /* Chassis, cockpit, restraint, ballast and mounting provisions. */
        }

        part def 'Autonomous Vehicle' :> VehicleBoundary {
            part PerceptionSystem : Perception;
            part AutonomousControlSystem : AutonomousControl;
            part VehicleMotionSystem : VehicleMotionControl;
            part SafetySystem : SafetyMonitoring;
            part ElectricalEnergySystem : ElectricalEnergy;
            part VehiclePlatform : VehicleStructure;

            bind course = PerceptionSystem.course;
            bind startCommand = AutonomousControlSystem.startCommand;
            bind hands = SafetySystem.handDevices;
            bind manualControls = SafetySystem.driverControlInput;
            bind manualControls = VehicleMotionSystem.manualControls;
            bind driverShutdown = SafetySystem.driverShutdown;
            bind externalShutdown = SafetySystem.externalShutdown;
            bind road = VehicleMotionSystem.road;
            bind charge = ElectricalEnergySystem.charge;
            bind lamp = AutonomousControlSystem.lamp;
            bind organiserStatus = AutonomousControlSystem.organiserStatus;

            connect PerceptionSystem.scene to AutonomousControlSystem.scene;
            connect VehicleMotionSystem.feedback to PerceptionSystem.motionFeedback;
            connect VehicleMotionSystem.feedback to AutonomousControlSystem.motionFeedback;
            connect AutonomousControlSystem.motionCommand to VehicleMotionSystem.autonomousCommand;
            connect AutonomousControlSystem.authority to VehicleMotionSystem.authority;
            connect SafetySystem.release to AutonomousControlSystem.release;
            connect SafetySystem.isolation to ElectricalEnergySystem.isolation;
            connect ElectricalEnergySystem.isolationStatus to AutonomousControlSystem.emergencyStatus;
            connect ElectricalEnergySystem.icsPower to AutonomousControlSystem.power;
            connect ElectricalEnergySystem.motionPower to VehicleMotionSystem.power;
        }

        part def ADCContext {
            part vehicle : VehicleBoundary;
            part safetyDriver : SafetyDriver;
            part officials : CompetitionOfficials;
            part course : CompetitionCourse;
            part charger : ChargingEquipment;

            connect course.cues to vehicle.course;
            connect course.road to vehicle.road;
            connect officials.startCommand to vehicle.startCommand;
            connect safetyDriver.hands to vehicle.hands;
            connect safetyDriver.controls to vehicle.manualControls;
            connect safetyDriver.shutdown to vehicle.driverShutdown;
            connect officials.shutdown to vehicle.externalShutdown;
            connect vehicle.lamp to officials.observeLamp;
            connect vehicle.organiserStatus to officials.receiveStatus;
            connect charger.charge to vehicle.charge;
        }

        part vehicleDesign : 'Autonomous Vehicle';
        part team : ProjectTeam;
        part context : ADCContext {
            part redefines vehicle = vehicleDesign;
        }
    }

    package FunctionalAnalysis {
        private import Exchanges::*;
        private import LogicalModel::vehicleDesign;

        action <F1> driveCourse {
            doc /* Nominal attempt, with the ICS in Autonomous State and propulsion available.
               Repeat the perceive-plan-control loop through all sectors until the rear clears
               the finish line. Include obstacle avoidance, complete intermediate sector stops
               and resumption. Those stops do not end Autonomous State. */
            in item courseCues : CourseCues;
            in item startSignal : StartSignal;
            in item currentAuthority : ControlAuthority;
            in item feedback : VehicleFeedback;
            out item motion : VehicleMotion = actOnRoad.motion;

            action perceive {
                in item cues : CourseCues = driveCourse.courseCues;
                in item motionFeedback : VehicleFeedback = driveCourse.feedback;
                out item scene : SceneEstimate;
            }
            action plan {
                doc /* Check that the start signal has arrived. Plan a path and target speed
                   inside the course, around obstacles and to a compliant stop or finish. */
                in item scene : SceneEstimate;
                in item startCommand : StartSignal = driveCourse.startSignal;
                out item motionPlan : MotionPlan;
            }
            action commandMotion {
                in item motionPlan : MotionPlan;
                in item motionFeedback : VehicleFeedback = driveCourse.feedback;
                out item command : MotionCommand;
            }
            action actOnRoad {
                doc /* Apply steering, traction and braking commands only with current
                   Autonomous authority. Hand release or driver intervention follows F2. */
                in item command : MotionCommand;
                in item authority : ControlAuthority = driveCourse.currentAuthority;
                out item motion : VehicleMotion;
            }

            first start then perceive;
            succession flow perceive.scene to plan.scene;
            succession flow plan.motionPlan to commandMotion.motionPlan;
            succession flow commandMotion.command to actOnRoad.command;
            first actOnRoad then done;
        }

        allocate driveCourse.perceive to vehicleDesign.PerceptionSystem;
        allocate driveCourse.plan to vehicleDesign.AutonomousControlSystem;
        allocate driveCourse.commandMotion to vehicleDesign.AutonomousControlSystem;
        allocate driveCourse.actOnRoad to vehicleDesign.VehicleMotionSystem;

        action <F2> disengageAutonomy {
            doc /* Trigger: release of either independent hand device or a driver input
               that influences motion. End Autonomous State immediately. An attempt in
               progress becomes invalid. F3 describes emergency energy isolation. */
            in item devices : HandDeviceStates;
            in item driverInput : ManualControlInput;
            out item authority : ControlAuthority = revokeAuthority.authority;
            out item indication : AutonomousIndication = updateStatus.indication;
            out item contact : OrganiserContact = updateStatus.contact;

            action detectIntervention {
                in item devices : HandDeviceStates = disengageAutonomy.devices;
                in item driverInput : ManualControlInput = disengageAutonomy.driverInput;
                out item release : AutonomyRelease;
            }
            action revokeAuthority {
                doc /* Remove autonomous command authority. Preserve the driver control
                   path when propulsion has not been isolated. */
                in item release : AutonomyRelease;
                out item authority : ControlAuthority;
            }
            action removeAutonomousCommand {
                in item authority : ControlAuthority;
            }
            action updateStatus {
                doc /* The ICS turns the indicator off and opens the organiser contact. */
                in item authority : ControlAuthority;
                out item indication : AutonomousIndication;
                out item contact : OrganiserContact;
            }

            first start then detectIntervention;
            succession flow detectIntervention.release to revokeAuthority.release;
            succession flow revokeAuthority.authority to removeAutonomousCommand.authority;
            succession flow revokeAuthority.authority to updateStatus.authority;
        }

        allocate disengageAutonomy.detectIntervention to vehicleDesign.SafetySystem;
        allocate disengageAutonomy.revokeAuthority to vehicleDesign.AutonomousControlSystem;
        allocate disengageAutonomy.removeAutonomousCommand to vehicleDesign.VehicleMotionSystem;
        allocate disengageAutonomy.updateStatus to vehicleDesign.AutonomousControlSystem;

        action <F3> isolatePropulsionInEmergency {
            doc /* Emergency shutdown from the internal or external device, or a
               fail-safe open-circuit fault. Functional path for the provisional
               Battery Electric design. Independent of ICS or power-controller logic. */
            in item request : EmergencyShutdownRequest;
            out item status : PropulsionIsolation = isolateEnergy.status;

            action tripShutdown {
                in item request : EmergencyShutdownRequest = isolatePropulsionInEmergency.request;
                out item trip : IsolationCommand;
            }
            action isolateEnergy {
                doc /* Physically isolate the propulsion battery and disable propulsion. */
                in item trip : IsolationCommand;
                out item status : PropulsionIsolation;
            }
            action endAutonomousState {
                doc /* The ICS cancels autonomous authority if powered. The lamp is off
                   and the normally open organiser contact opens or remains open. */
                in item status : PropulsionIsolation;
                out item indication : AutonomousIndication;
                out item contact : OrganiserContact;
            }

            first start then tripShutdown;
            succession flow tripShutdown.trip to isolateEnergy.trip;
            succession flow isolateEnergy.status to endAutonomousState.status;
            first endAutonomousState then done;
        }

        allocate isolatePropulsionInEmergency.tripShutdown to vehicleDesign.SafetySystem;
        allocate isolatePropulsionInEmergency.isolateEnergy to vehicleDesign.ElectricalEnergySystem;
        allocate isolatePropulsionInEmergency.endAutonomousState to vehicleDesign.AutonomousControlSystem;
    }

    package VehicleBaselineV1 {
        doc /* Accepted for this assignment as the common/category-neutral vehicle requirements baseline. Verification is planned. */
        private import StakeholderExpectations::*;
        private import LogicalModel::*;

        requirement <'SR-ADC-101'> startAttempt {
            doc /* The vehicle shall wait behind the start line until the start signal and fully cross the line within 60 s after the signal.
               Source: IV 407b-d. Planned verification: Track test: timestamp the signal and the full crossing. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from startAttempt to CompleteAllSectors;
        allocate startAttempt to vehicleDesign.AutonomousControlSystem;

        requirement <'SR-ADC-102'> trackEnvelope {
            doc /* During an attempt the vehicle shall stay entirely inside the course boundary and avoid contact with obstacles or barriers.
               Source: IV 407e(i),(iii); 408. Planned verification: Track test: observe the full vehicle envelope and record contact. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from trackEnvelope to CompleteAllSectors;
        allocate trackEnvelope to vehicleDesign.VehicleMotionSystem;

        requirement <'SR-ADC-103'> sectorStop {
            doc /* At each sector stop line the vehicle shall stop fully with its front at most 3.5 m short, without crossing the line during the stop. It shall resume before the stationary time exceeds 30 s.
               Source: IV 406d; 407e(ii),f. Planned verification: Track test: measure stop position, zero speed and dwell. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from sectorStop to CompleteAllSectors;
        allocate sectorStop to vehicleDesign.VehicleMotionSystem;

        requirement <'SR-ADC-104'> autonomousFinish {
            doc /* The vehicle shall fully cross the finish within the event time limit and remain in Autonomous State from front crossing at the start until rear crossing at the finish.
               Source: IV 407e(iv)-(v),g; 409. Planned verification: Track test: compare state and finish timestamps with the event limit. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from autonomousFinish to CompleteAllSectors;
        allocate autonomousFinish to vehicleDesign.AutonomousControlSystem;

        requirement <'SR-ADC-105'> onboardControl {
            doc /* The vehicle shall use a securely mounted, vehicle-powered Internal Computer System (ICS) for all autonomous driving decisions during an attempt.
               Source: IV 411b-c. Planned verification: Inspection and test: review power and mounting, then demonstrate operation without external control or computing. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from onboardControl to CompleteAllSectors;
        allocate onboardControl to vehicleDesign.AutonomousControlSystem;

        requirement <'SR-ADC-106'> independentHandDevices {
            doc /* The vehicle shall provide two independent, vehicle-mounted devices, one per hand, that require continuous activation for Autonomous State and prevent reaching or operating the steering wheel while both are engaged.
               Source: IV 405e; 412f. Planned verification: Inspection and test: check placement and operate each device independently. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from independentHandDevices to ZeroSafetyInfractions;
        allocate independentHandDevices to vehicleDesign.SafetySystem;

        requirement <'SR-ADC-107'> endAutonomousAuthority {
            doc /* The vehicle shall immediately end Autonomous State on release of either hand device or any safety-driver input that influences vehicle control.
               Source: IV 405b; 412a-c,f. Planned verification: Controlled test: release left, release right and apply driver control input separately. Observe authority and record response time. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from endAutonomousAuthority to ZeroSafetyInfractions;
        allocate endAutonomousAuthority to vehicleDesign.SafetySystem;

        requirement <'SR-ADC-108'> indicateAutonomousState {
            doc /* The ICS shall exclusively control a roof-mounted orange indicator lit only in Autonomous State, visible from all directions at 50 m or more in bright daylight.
               Source: IV 412d. Planned verification: Inspection and demonstration: check exclusive control and visibility around the vehicle. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from indicateAutonomousState to ZeroSafetyInfractions;
        allocate indicateAutonomousState to vehicleDesign.AutonomousControlSystem;

        requirement <'SR-ADC-109'> reportAutonomousState {
            doc /* The ICS shall close the normally open organiser status contact only in Autonomous State and leave it open in every other state.
               Source: IV 412e. Planned verification: Electrical test: check the contact in autonomous, manual and unpowered conditions. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from reportAutonomousState to ZeroSafetyInfractions;
        allocate reportAutonomousState to vehicleDesign.AutonomousControlSystem;

        requirement <'SR-SAF-003'> failSafeShutdown {
            doc /* The vehicle shall provide a fail-safe emergency shutdown that disables its energy supply and propulsion.
               Source: I 37a-b. Planned verification: Design review and controlled test: assess and test representative open-circuit faults. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from failSafeShutdown to ZeroSafetyInfractions;
        allocate failSafeShutdown to vehicleDesign.SafetySystem;

        requirement <'SR-SAF-004'> twoShutdownControls {
            doc /* The vehicle shall provide a driver-reachable internal shutdown and a rear external shutdown on fixed bodywork. The marked external device shall be red, protruding, latching and reset only by rotation.
               Source: I 37g-h. Planned verification: Inspection and test: check location, marking, accessibility and operation of each device. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from twoShutdownControls to ZeroSafetyInfractions;
        allocate twoShutdownControls to vehicleDesign.SafetySystem;

        requirement <'SR-SAF-019'> secureBallastIfRequired {
            doc /* Where driver weight requires ballast, the vehicle shall secure compliant ballast outside the driver compartment in at most three locations and provide a seal passage of at least 7 mm. Adjustment or removal shall break the seal.
               Source: I 20a-c. Planned verification: Weigh and inspect: check driver threshold, ballast material, fixings, hole and seal. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from secureBallastIfRequired to ZeroSafetyInfractions;
        allocate secureBallastIfRequired to vehicleDesign.VehiclePlatform;

        requirement <'SR-SAF-101'> restrainSafetyDriver {
            doc /* The vehicle shall carry the Safety Driver during an attempt and provide an effective harness with at least five mounting points rated for at least 200 N in any direction per point.
               Source: I 29a,d; IV 405c,e. Planned verification: Inspection and evidence review: check harness, seat and evidence for each mounting point. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from restrainSafetyDriver to ZeroSafetyInfractions;
        allocate restrainSafetyDriver to vehicleDesign.VehiclePlatform;

        requirement <'SR-SAF-102'> protectDriverFootSpace {
            doc /* The vehicle shall provide at least 100 mm of crush space between the front body and the driver's feet.
               Source: I 25a(ii). Planned verification: Measure the spacing with the driver in position. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from protectDriverFootSpace to ZeroSafetyInfractions;
        allocate protectDriverFootSpace to vehicleDesign.VehiclePlatform;

        requirement <'SR-SAF-103'> steeringControl {
            doc /* The vehicle shall steer primarily through the front wheels. Electrically operated indirect steering, if used, shall default to a safe state on detected faults and on emergency power removal.
               Source: I 32. Planned verification: Inspect steering and check the safe state in controlled fault and power-loss tests where applicable. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from steeringControl to ZeroSafetyInfractions;
        allocate steeringControl to vehicleDesign.VehicleMotionSystem;
    }

    package ProcessBaselineV1 {
        doc /* Team obligations tracked alongside the vehicle requirements. */
        private import StakeholderExpectations::*;
        private import LogicalModel::*;

        requirement <'SR-PRJ-003'> registerForADC {
            doc /* The team shall register separately for ADC, provide readiness evidence and pass the applicable inspection and engagement/disengagement demonstration. The Safety Driver and Team Manager shall attend the ADC briefing.
               Source: IV 403b; 404; 405a-b,d. Planned verification: Review registration and inspection evidence and record briefing attendance. */
            subject target : ProjectTeam;
        }
        dependency from registerForADC to PassInspectionFirstTime;
        allocate registerForADC to team;

        requirement <'SR-PRJ-101'> submitBusinessPresentation {
            doc /* The team shall participate to be ranked, submit its presentation PDF before the On-Track Challenge and use no more than four student presenters.
               Source: IV 414b,f-g. Planned verification: Review the submitted PDF timestamp and presenter roster. */
            subject target : ProjectTeam;
        }
        dependency from submitBusinessPresentation to DeliverBusinessPresentation;
        allocate submitBusinessPresentation to team;

        requirement <'SR-DOC-003'> maintainRuleTrace {
            doc /* The team shall record the season and clause for each regulatory requirement, assess the effect of revisions, update affected model elements under their stable IDs and repeat the applicable checks.
               Source: A4 section 2 and U-1. Planned verification: Audit baseline records and the impact trail for a rule revision. */
            subject target : ProjectTeam;
        }
        dependency from maintainRuleTrace to RuleChangeImpactControl;
        allocate maintainRuleTrace to team;

        requirement <'SR-DOC-101'> traceBaselineRequirements {
            doc /* The team shall record the parent objective, allocation and planned verification for every v1.0 baseline requirement.
               Source: A4 O-07. Planned verification: Audit the baseline model and verification register for complete coverage. */
            subject target : ProjectTeam;
        }
        dependency from traceBaselineRequirements to TraceableRequirements;
        allocate traceBaselineRequirements to team;
    }

    package ConditionalCandidates {
        doc /* Category, energy-class or event dependent. Use Battery Electric only as a design assumption. Article 413 is reviewed against the 2027 wording, resolving the earlier source gap U-1. */
        private import StakeholderExpectations::*;
        private import LogicalModel::*;

        requirement <'SR-SAF-005'> isolatePropulsionBattery {
            doc /* For a Battery Electric vehicle, shutdown shall physically isolate the propulsion battery with an air gap after short-circuit protection and before the vehicle electrical system. Isolation shall not be driven by power-controller logic. Any relay used shall be normally open.
               Source: I 37e. Planned verification: Inspect the isolation path and verify de-energisation in a controlled test. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from isolatePropulsionBattery to ZeroSafetyInfractions;
        allocate isolatePropulsionBattery to vehicleDesign.ElectricalEnergySystem;

        requirement <'SR-P-005'> prototypeDriverBallast {
            doc /* For Prototype, the driver including gear shall meet the 50.0 kg minimum weight with compliant ballast where required.
               Source: I 20a-c. Planned verification: Weigh the driver with gear and inspect any ballast. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from prototypeDriverBallast to PassInspectionFirstTime;
        allocate prototypeDriverBallast to vehicleDesign.VehiclePlatform;

        requirement <'SR-UC-008'> urbanConceptDriverBallast {
            doc /* For Urban Concept, the driver including gear shall meet the 70.0 kg minimum weight with compliant ballast where required.
               Source: I 20a-c. Planned verification: Weigh the driver with gear and inspect any ballast. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from urbanConceptDriverBallast to PassInspectionFirstTime;
        allocate urbanConceptDriverBallast to vehicleDesign.VehiclePlatform;

        requirement <'SR-ADC-110'> eventParameters {
            doc /* Load event-specific sector count, attempt and course time limits when issued. Confirm any organiser camera and telemetry installation requests.
               Source: II; IV 405d; 406c; 407e(iv),g; 409; 412g; 413. Planned verification: Review the chosen event Chapter II and organiser notice, then verify configured values. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from eventParameters to CompleteAllSectors;
        allocate eventParameters to vehicleDesign.AutonomousControlSystem;

        requirement <'SR-SAF-104'> batteryElectricProtection {
            doc /* If Battery Electric is confirmed, use at most one electric storage device and two electric motors, a lithium-based battery and an onboard BMS. Apply the ADC purpose-built motor-controller exception.
               Source: I 66a-c; IV 402b(vi). Planned verification: Inspect the energy inventory and equipment against the applicable articles. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from batteryElectricProtection to ZeroSafetyInfractions;
        allocate batteryElectricProtection to vehicleDesign.ElectricalEnergySystem;

        requirement <'SR-ADC-111'> measureDevelopmentEfficiency {
            doc /* For the Battery Electric design, record electrical energy used and distance covered on a valid development attempt and calculate distance per unit of energy.
               Source: A4 G-04 and O-05; IV 415a-b. Planned verification: Test: review distance and energy logs and recompute the efficiency metric. This is a team design requirement. */
            subject target : 'Autonomous Vehicle';
        }
        dependency from measureDevelopmentEfficiency to CompetitiveEfficiency;
        allocate measureDevelopmentEfficiency to vehicleDesign.ElectricalEnergySystem;
    }

    package ConceptAlternatives {
        private import LogicalModel::*;
        private import FunctionalAnalysis::*;

        part def PrototypeBE :> VehicleBoundary {
            doc /* Candidate boundary configuration; I 20a, 25a(i), 39 and 43.
               Verify cockpit packaging and access before a category decision. */
        }
        part def UrbanConceptBE :> VehicleBoundary {
            doc /* Candidate boundary configuration; I 20a, 25a(iii), 45, 46 and 51.
               Compare driver accommodation and vehicle packaging. */
        }
        part prototypeCandidate : PrototypeBE;
        part urbanConceptCandidate : UrbanConceptBE;

        part def ComputeNode;
        part def CentralisedICS {
            doc /* Candidate A and initial integration reference. A single onboard compute node executes perception,
               planning and control. A separate safety monitor and the independent
               emergency isolation path are retained. */
            part onboardCompute : ComputeNode;
            part safetyMonitor : SafetyMonitoring;
            part propulsionEnergy : ElectricalEnergy;
            allocate driveCourse.perceive to onboardCompute;
            allocate driveCourse.plan to onboardCompute;
            allocate driveCourse.commandMotion to onboardCompute;
            allocate disengageAutonomy.detectIntervention to safetyMonitor;
            allocate isolatePropulsionInEmergency.isolateEnergy to propulsionEnergy;
        }
        part def DistributedICS {
            doc /* Candidate B. Perception and motion control run on separate onboard
               nodes within the ICS boundary. Loss or staleness of inter-node data
               needs an explicit response and verification. */
            part perceptionCompute : ComputeNode;
            part controlCompute : ComputeNode;
            part safetyMonitor : SafetyMonitoring;
            part propulsionEnergy : ElectricalEnergy;
            allocate driveCourse.perceive to perceptionCompute;
            allocate driveCourse.plan to controlCompute;
            allocate driveCourse.commandMotion to controlCompute;
            allocate disengageAutonomy.detectIntervention to safetyMonitor;
            allocate isolatePropulsionInEmergency.isolateEnergy to propulsionEnergy;
        }
    }

    package FunctionRequirementTrace {
        private import FunctionalAnalysis::*;
        private import VehicleBaselineV1::*;
        private import ConditionalCandidates::*;

        dependency from driveCourse to startAttempt, trackEnvelope, sectorStop, autonomousFinish, onboardControl;
        dependency from disengageAutonomy to independentHandDevices, endAutonomousAuthority, indicateAutonomousState, reportAutonomousState;
        dependency from isolatePropulsionInEmergency to failSafeShutdown, twoShutdownControls, isolatePropulsionBattery;
    }

    package ModelViews {
        view blackBox : StandardViewDefinitions::GeneralView {
            expose LogicalModel::ADCContext;
            expose LogicalModel::VehicleBoundary;
        }
        view whiteBox : StandardViewDefinitions::GeneralView {
            expose LogicalModel::'Autonomous Vehicle';
            expose FunctionalAnalysis::driveCourse;
            expose FunctionalAnalysis::disengageAutonomy;
            expose FunctionalAnalysis::isolatePropulsionInEmergency;
        }
        view requirementsV1 : StandardViewDefinitions::GeneralView {
            expose VehicleBaselineV1::*;
            expose ProcessBaselineV1::*;
        }
    }
}
