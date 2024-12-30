// Crear el nodo principal para Puertas Lógicas Cuánticas
CREATE (puertasQuantum:PuertaLogicaCuantica {
    descripcion: "Componentes fundamentales en la computación cuántica que realizan operaciones sobre qubits."
})

// Crear nodos para Puertas Específicas
CREATE (cnot:CNOT {
    nombre: "Puerta CNOT",
    descripcion: "Una puerta de dos qubits que aplica una operación NOT al segundo qubit (target) si el primer qubit (control) está en estado |1⟩.",
    qubits: 2
})
CREATE (toffoli:Toffoli {
    nombre: "Puerta Toffoli",
    descripcion: "También conocida como puerta CCNOT, es una puerta de tres qubits que aplica una operación NOT al tercer qubit si los dos primeros qubits están en estado |1⟩.",
    qubits: 3
})
CREATE (controlLogic:ControlLogicGate {
    nombre: "Puerta de Lógica de Control",
    descripcion: "Puertas que realizan operaciones condicionales basadas en el estado de uno o más qubits de control.",
    qubits: "Variable"
})
CREATE (cpn:CPnGate {
    nombre: "Puerta CP^n",
    descripcion: "Una puerta controlada que aplica una fase determinada al estado objetivo basado en el estado de los qubits de control.",
    qubits: "Variable"
})

// Crear nodo para Qiskit
CREATE (qiskit:Qiskit {
    nombre: "Qiskit",
    descripcion: "Kit de desarrollo de software cuántico de código abierto de IBM para trabajar con computadoras cuánticas."
})

// Establecer relaciones entre Puertas Lógicas Cuánticas y Qiskit
CREATE (puertasQuantum)-[:ES_IMPLEMENTADA_EN]->(qiskit)
CREATE (cnot)-[:ES_TIPO_DE]->(puertasQuantum)
CREATE (toffoli)-[:ES_TIPO_DE]->(puertasQuantum)
CREATE (controlLogic)-[:ES_TIPO_DE]->(puertasQuantum)
CREATE (cpn)-[:ES_TIPO_DE]->(puertasQuantum)

// Relacionar Puertas con Qiskit
CREATE (cnot)-[:SOPORTADA_POR]->(qiskit)
CREATE (toffoli)-[:SOPORTADA_POR]->(qiskit)
CREATE (controlLogic)-[:SOPORTADA_POR]->(qiskit)
CREATE (cpn)-[:SOPORTADA_POR]->(qiskit)
