# GridFlex Bridge

A scalable testbed and stakeholder engagement process for evaluating the
impact of customer-led Agentic AI 'flexibility provision' agents on low
voltage networks

## Developer setup

### Dev container

- Open the repository in VS Code and choose *Reopen in Container* to get
  a reproducible toolchain with the recommended extensions
  pre-installed.
- The container bootstrap installs [uv](https://github.com/astral-sh/uv)
  plus the configured `pre-commit` hooks automatically; re-run
  `pre-commit install --install-hooks` if you change the configuration.

### Code quality workflow

- Prefer the task runner in [Justfile](Justfile): `just fmt`,
  `just lint`, `just pre-commit`, or `just check` to run them all
  sequentially with friendly `gum` spinners.
- Under the hood the tasks call `uv tool run ruff format .`,
  `uv tool run ruff check .`, and
  `uv tool   run pre-commit run --all-files`; feel free to run those
  directly in CI or scripts if you prefer.
- Project-wide Ruff defaults live in [pyproject.toml](pyproject.toml);
  adjust module-specific ignores via `per-file-ignores` rather than
  disabling rules globally.

## The problem

Agentic AI will soon be able perform physical and economic actions to
control distributed energy resources on users' behalf. Who controls the
AI (energy suppliers, aggregators, equipment manufacturers, system
operators or end users) could lead to very different outcomes in terms
the amount and reliability of available flexibility, the cost of energy,
and the distributional benefits to end-users. We don't have the tools to
explore these issues. GridFlex-Research (WP7) would build a testbed, and
a stakeholder engagement process, that allows us to do this.

## The focus

The initial focus of this would be to explore how agentic AI working
for, and controlled by, domestic customers to manage their DERs (EVs,
HPs, Smart inverters, Smart thermostats BESS, TESS) and choose their
suppliers and tariffs, would affect flexibility provision, network
loading, and market dynamics.

## Vision for GridFlex-Bridge

To design and build a simple proof-of-concept testbed which can simulate
a small number of homes on an LV network. Each home will have a
generator (e.g. PV with smart inverter); a store (e.g. an EV or BESS);
and a shiftable load (e.g. a heat pump) and an agentic AI managing
these. These AI will be able to act independently or cooperatively. The
AIs will have the ability to switch between current market suppliers and
their tariffs. The AIs will be instructed by, and act as representatives
of, participants in a series of stakeholder workshops used to help
identify the opportunities and risks that might emerge from the
deployment of such agents on LV networks. This work would then be used
to form the functional specification of work to for consideration under
the GridFlex Scale programme.

## Vision for GridFlex-Scale

The GridFlex-Bridge testbed will use a Multi-Agent System architecture.
For GridFlex-Scale this would be scaled and deployed over distributed
computing resources -- specifically RaspberryPi. It would include
hardware in the loop functionality that could take signals from key
customer DERs as well as key environmental variables in real time. It
would be deployed in living laboratories with the AI agents using Model
Context Protocol to take signals from smart meters, from grid carbon
intensity trackers, as well as be connected in real time to supplier and
tariff switching websites. We would work with Ofgem to seek permission
to trial live supplier and tariff switching by the agents within the
Energy & AI sandbox and living laboratory environment. To the extent
possible, the AI agents would be given direct control over generation,
storage and large loads. This is a much larger programme of work with
work-packages addressing the primary research challenges across three
interdisciplinary domains discussed below.

## Timeliness

It is likely that someone will independently launch an Agentic AI home
energy management system (HEMS) with tariff switching capacity without
any regulatory oversight and with the agents acting solely in the
individual end-user's interests (i.e. non-cooperatively) soon. If such
agents become widely adopted, they will be hard to displace or
retrospectively regulate and their impact on the system will be hard to
predict.

Government currently has several initiatives that will facilitate
deployment of AI tariff switching agents. These include: DESNZ's Smart
Secure Electricity Systems (SSES) work on accessible tariff data and
technology standards to ensure interoperability of assets making tariff
comparison and switching easier; SSES work on 'smart home' algorithms
standards but isn't considering AI agents at present; Ofgem's AI sandbox
to enable testing of AI applications in safe environments; HMG's
Incubator for Artificial Intelligence (i.AI) within GDS.

## Routes to DER flexibility automation - supplier led and customer led

The supplier led version could be called the Kraken model, where some
centralised system run by suppliers manages customer assets in exchange
for a better tariff offering. This is the natural evolution of the
current energy system and will likely end up with a relatively small
number of relatively large suppliers competing for control of customer's
assets by offering a reasonably limited range of tariff offerings. This
doesn't reduce customer stickiness and tariff switching transactions
costs.

The customer led version sees an AI agent acting on end-user's behalf
that could switch tariffs and control large loads. This could have major
impacts on the energy system. On the up-side it could increase 'active'
customer market participation and hence supplier competition; allow for
more complex tariff structures (for example time and type of use,
multiple supplier models, and differentiated suppler and network
tariffs); reduce overall household bills and disadvantages for
disengaged customers; reduce customer acquisition costs for new market
entrants; better align flexibility with end-user routines through
calendar synching; and be more trusted if offered by a non-energy market
actor. On the down-side, it could undermine existing suppliers' business
models; undermine suppliers' capacity to deliver regulated services;
lead to unintended consequences like wide-scale attempts at synchronous
tariff switching overloading systems.

## The DER asset 'coordination dividend' (i.e. 'The price of anarchy')

Arguably the most important downside is that if AI agents lacked
coordination capacity and LV network situational awareness (i.e. aren't
context sensitive and cooperative) then we could lose around 30%
headroom capacity on the network, costing customers around 10 to 15
billion pounds between now and 2030 in network reinforcement costs. This
is 'the price of anarchy' -- i.e. the system efficiency loss of each
agent acting selfishly (i.e. the Nash equilibrium) compared with agents
acting cooperatively (i.e. the social or 'cooperative' optimum).

There are several approaches to minimizing the price of anarchy. These
range from tariff and market mechanism design, to centralized control of
all network connected devices, through hierarchical control
architectures, to fully decentralized control by distributed agents
working in cooperative or selfish ways. As yet, we have no testbed for
evaluating the efficacy of different approaches and their likely
combinations and evaluating the system costs and distributional impacts
of different strategies.

## Behavioural science research challenges

There are two major behavioural science areas that this research
addresses.

1. *The Representation problem:* How do people understand, articulate
    and communicate their preferences to their AI agent. Representative
    agents could change the relationship between people and markets by
    closing the 'value-action gap' between people's stated preferences
    (what they say they would like to do), and revealed preferences
    (what they actually do). This links this research to the UKRI Energy
    Demand Research Centre's 'Flexibility' theme and the work that
    Dr. Michael Fell is doing on this topic in that Centre.

2. *How the design of boundary objects influences consensus formation
    in consultation processes:* A boundary object is a model (in the
    broad sense of that term) of a system shared by different parties to
    a consultation process. Peoples' beliefs are dynamic and updated
    through time. The source, form, order and social context of
    information all affect how individual beliefs change and consensus
    positions are reached. How consultation processes are designed
    therefore strongly influences their outcome. This links this
    research to the Behavioural Research UK Leadership Hub's
    'Environment and Sustainability' theme and the work that David
    Shipworth is doing on this topic.

## Computer science research challenges

There are two major research challenges in the fields of computer
science that this work addresses:

1. *The Alignment Problem:* How do we ensure that the objectives of the
    AI agent align with those of the user. This is a substantial focus
    of AI research and decomposes into several components. Of these,
    'value alignment' and 'interpretability & transparency' will be
    important in this context.
2. *The Cooperative AI challenge:* The field of Cooperative AI research
    addresses collective action problems where there is a big disparity
    between competitive approaches (e.g. Nash equilibria in
    non-cooperative games) and cooperative outcomes that maximize
    collective welfare. This is a large area of research spanning game
    theory to economics. Some key challenges relevant to this context
    include:

    1. Mechanism design for multi-agent systems
    2. Multi-agent reinforcement learning with norm induction
    3. Bayesian trust models
    4. Belief modeling and inference
    5. Social welfare functions embedded in multi-agent reinforcement
        learning
    6. Hierarchical cooperation frameworks

## Game theory challenges

There are two major research challenges in the field of game theory that
this work addresses. The uniqueness of game theoretic solutions rests on
the 'monotonicity assumption', i.e. that that adding more agents, or
increasing connectivity between agents, does not reduce the set of
equilibrium solutions or make outcomes worse for any player. In
cooperative and networked games this assumption can be violated in two
ways:

1. *Topological violations:* If networks are highly clustered with few
    edges between clusters then this can create dependencies that
    destabilize previously stable solutions.
2. *Scale-free or hub-dominated networks:* Here adding a new hub can
    cause previously cooperative equilibria to collapse.

## System characteristics needed in a testbed

Many argue that, like with IoT systems, the real-time dynamic balancing
of thousands of DERs under uncertainty and network constraints requires
a multi-agent systems (MAS) approach. In MAS, autonomous devices operate
independently, process system-level and local sensor inputs, run
algorithms on embedded processors, and execute local actions. Here
communication networks and distributed model predictive control
algorithms with real-time feedback are as critical as the electricity
networks themselves in ensuring system stability. Systems of DERs face
dynamic constraints including power flow limitations (thermal line
limits, voltage stability), data flow restrictions (bandwidth, latency,
lossiness), and financial flow constraints (speed and cost of market
mechanisms), and effective modelling must represent all these
cyber-physical and market constraints with high temporal resolution
while simulating the interactions among electricity, communications, and
market layers. Current models often focus solely on DER technologies,
overlooking these critical interactions. DER flexibility models should
therefore mirror the system's structure by embedding power, data, and
financial flows into the model architecture.

Additionally, increasingly seen in other sectors, the models would
support the entire project lifecycle, from schematic design to full
system operation, and be flexible, modular, and scalable to grow
organically with the project. On the industry side, real-time
hardware-in-the-loop operation enables fault detection, asset
management, error correction via sensor feedback, model calibration, and
learning algorithms using Bayesian and other methods all of which
support value stacking by flexibility service providers. On the customer
side, such models also facilitate community engagement through
participatory design, exploring market choices transparently, and
supporting human-in-the-loop modelling to capture stakeholder
preferences in serious games, living labs, and field trials through
companion modelling approaches. The same model architecture should be
flexible enough to go from schematic system design, through interactive
community consultation, to early-stage field-trial deployment, to full
DERMS deployment.

## Why co-simulate multi-agent DER systems?

Co-simulation involves decomposing larger systems into subsystems
modelled on distributed hardware, where each subsystem acts as an
autonomous agent within the larger system. This approach supports
discrete time and event-driven simulations and is particularly
advantageous for cyber-physical systems, where cyber components like
wireless signal propagation are modelled in physical contexts.
Additionally, autonomous agents working collectively can solve complex
optimization problems that are otherwise challenging, such as
nondifferentiable optimization tasks. Co-simulation is also valuable in
communicating and exploring DER systems, allowing participants to
independently develop DER models and then run them in parallel for
performance comparison, making it suitable for hackathons and community
engagement events. Hardware-in-the-loop capabilities foster the
construction of physical scale models for participatory local energy
system design.

These characteristics support transitioning from conceptual design to
fully functional energy management systems and integration of modelling
with measurement. Designers can model subsystems as parameters
(e.g. smart inverters, electric vehicles, battery energy storage
systems, heat pumps, and HVAC systems) while measuring environmental or
behavioural parameters (e.g., wireless signal attenuation, human market
behaviour). Co-simulation inherently supports data privacy by local
processing and anonymization, enables exploration of physical object
usability through interaction with physical model hardware, overcomes
scaling limitations with modularity, and provides real-time feedback to
reduce control uncertainty.

## What might a potential testbed platform look like?

Imagine a 3D printed model of a local area, with physical scale models
of real energy assets (PV cells, matchbox car sized EVs, etc) that
people can move around on the model. Then imagine those mini energy
assets are communicating through a wireless network into a local energy
system model that links and coordinates all their actions in real time.
Then imagine energy system planners, policy makers or community energy
groups being able to add, remove and physically move these assets around
and see the implications of their choices immediately on system
performance. Imagine hackathons where teams playing different roles work
in parallel. A regulator team sets new market and tariff rules. A
supplier team makes tariff offerings consistent with those rules and
encodes tariffs into the central coordination unit of a MAS DER system.
These rules are communicated out as pricing structures to customers' DER
coordination AI agents that then choose between tariffs and enact their
customers' pre-stated preferences (cost or carbon savings, energy
autarky, thermal preferences, EV charge time constraints, etc). A
citizens' assembly/end-user representative team agree on rules governing
shared assets. The system runs for a representative year, and a
dashboard of metrics is produced: cost per customer, use of shared
assets, distribution of benefits, impacts on the network, etc. that the
teams can then discuss and iterate on.

There are many use-cases for a model with such capacity. It can be used
to test the rules governing many forms of DERs, from individual control
over a single private asset, to rules governing the behaviour of shared
infrastructure. It can be used to 'red team' the impact of malign agents
injected into MAS DER systems. It can be used to assess the impact of
system operation network headroom or network expansion costs for
different combinations of tariff, market, algorithm and AI Agent
combinations under uncertainty where an analytic solution would be
impossible to calculate.

An early version of such a system has been developed at TU Delft (see
'[Illuminator GitHub repository](https://github.com/Illuminator-team)'
and [TUDelft Illuminator
project](https://www.tudelft.nl/en/powerweb-institute/research/projects/the-illuminator)
as well as the
[Mosaik](https://mosaik.readthedocs.io/en/latest/overview.html)
co-simulation platform. This was developed by the power systems
engineering team at TU Delft and built initially for teaching their
students about energy systems.

It has a lot of useful features including:

- You can run it on either a single device or distribute the simulation
  components over multiple Raspberry Pis which can be co-located or
  disbursed, and which are centrally coordinated by a master systems
  manager on one of the Pis.
- You can draw an energy system on a whiteboard and that can be
  translated into a power system diagram automatically and then run and
  tested.
- You can add different market structure modules and see how the outcome
  changes by trialing different market designs.
- You can feed in live sensor streams, so can pin model variables to
  real-time sensor data and monitor model variable drift from the sensor
  data stream.

Illuminator has GitHub library including Python models of energy system
components (e.g., PVs, heat pumps, batteries), XML configurations for
power systems ranging from homes to communities, and CSV files for
time-series scenarios such as weather and prices. They have developed an
extension for Community Energy Digital Twin modelling follows the
CEN-CENELEC SGAM conceptual model, creating a Multi-layered Energy
Community Architecture (MECA) with layers for environment, energy
assets, controls, agents, and games.

Illuminator is one framework for constructing such an agentic AI
testbed. There will be others, but the characteristics need are,
probably common across them. I think it would be worth considering
building such a testbed within the Digitalising Energy Flexibility
programme as a shared technology layer bringing different work packages
together. Alternatively, a pilot testbed could be built withing WP7 for
possible expansion during the 'scale' stage.
