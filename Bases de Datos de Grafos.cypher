// Crear el nodo principal para Bases de Datos de Grafos
CREATE (bddg:BaseDeDatosDeGrafos {
    descripcion: "Tipo de base de datos NoSQL diseñada para representar y almacenar datos en forma de grafos, permitiendo modelar relaciones complejas entre entidades."
})

// Crear nodos para Componentes Principales
CREATE (nodos:Nodo {
    descripcion: "Representan entidades o elementos individuales, como personas, lugares, objetos, conceptos, etc."
})
CREATE (aristas:Arista {
    descripcion: "Representan las relaciones entre los nodos."
})
CREATE (propiedades:Propiedad {
    descripcion: "Atributos que contienen información adicional sobre nodos y aristas, almacenados como pares clave-valor."
})

// Crear relaciones desde BaseDeDatosDeGrafos a Componentes
CREATE (bddg)-[:TIENE_COMPONENTE]->(nodos)
CREATE (bddg)-[:TIENE_COMPONENTE]->(aristas)
CREATE (bddg)-[:TIENE_COMPONENTE]->(propiedades)

// Crear nodos para Ventajas
CREATE (modelado:Ventaja {
    nombre: "Modelado Natural de Relaciones Complejas",
    descripcion: "Ideales para aplicaciones que requieren representar y consultar relaciones intrincadas entre entidades."
})
CREATE (flexibilidad:Ventaja {
    nombre: "Alta Flexibilidad",
    descripcion: "Permiten agregar nuevos tipos de relaciones y entidades sin necesidad de reestructurar la base de datos."
})
CREATE (eficiencia:Ventaja {
    nombre: "Eficiencia en Consultas de Relaciones",
    descripcion: "Optimizado para realizar consultas que involucran múltiples niveles de relaciones, ofreciendo un rendimiento superior."
})

// Crear relaciones desde BaseDeDatosDeGrafos a Ventajas
CREATE (bddg)-[:OFRECE_VENTAJA]->(modelado)
CREATE (bddg)-[:OFRECE_VENTAJA]->(flexibilidad)
CREATE (bddg)-[:OFRECE_VENTAJA]->(eficiencia)

// Crear nodos para Casos de Uso
CREATE (redesSociales:CasoDeUso {nombre: "Redes Sociales", descripcion: "Representar usuarios, sus amistades, interacciones, publicaciones, etc."})
CREATE (sistemasRecomendacion:CasoDeUso {nombre: "Sistemas de Recomendación", descripcion: "Relacionar productos, usuarios, preferencias y comportamientos para generar recomendaciones personalizadas."})
CREATE (analisisFraudes:CasoDeUso {nombre: "Análisis de Fraudes", descripcion: "Detectar patrones y conexiones entre transacciones que podrían indicar actividades fraudulentas."})
CREATE (gestionRedes:CasoDeUso {nombre: "Gestión de Redes y Telecomunicaciones", descripcion: "Modelar la infraestructura de redes, dispositivos y conexiones entre ellos."})
CREATE (gestionConocimiento:CasoDeUso {nombre: "Sistemas de Gestión de Conocimiento", descripcion: "Organizar información y conceptos interrelacionados para facilitar la búsqueda y el descubrimiento de conocimientos."})

// Crear relaciones desde BaseDeDatosDeGrafos a Casos de Uso
CREATE (bddg)-[:UTILIZADO_EN]->(redesSociales)
CREATE (bddg)-[:UTILIZADO_EN]->(sistemasRecomendacion)
CREATE (bddg)-[:UTILIZADO_EN]->(analisisFraudes)
CREATE (bddg)-[:UTILIZADO_EN]->(gestionRedes)
CREATE (bddg)-[:UTILIZADO_EN]->(gestionConocimiento)

// Crear nodos para Ejemplos de Bases de Datos
CREATE (neo4j:EjemploBD {
    nombre: "Neo4j",
    descripcion: "Una de las bases de datos de grafos más populares, conocida por su facilidad de uso y potente lenguaje de consulta, Cypher."
})
CREATE (amazonNeptune:EjemploBD {
    nombre: "Amazon Neptune",
    descripcion: "Servicio de base de datos de grafos totalmente gestionado por AWS, compatible con los modelos de grafos Property Graph y RDF."
})
CREATE (orientdb:EjemploBD {
    nombre: "OrientDB",
    descripcion: "Base de datos multimodelo que soporta grafos, documentos, claves-valor y otros modelos de datos."
})
CREATE (arangodb:EjemploBD {
    nombre: "ArangoDB",
    descripcion: "Otra base de datos multimodelo que permite trabajar con grafos, documentos y otros tipos de datos de manera integrada."
})
CREATE (janusgraph:EjemploBD {
    nombre: "JanusGraph",
    descripcion: "Base de datos de grafos escalable y distribuida, diseñada para integrarse con tecnologías como Apache Cassandra y HBase."
})

// Crear relaciones desde BaseDeDatosDeGrafos a Ejemplos de Bases de Datos
CREATE (bddg)-[:TIENE_EJEMPLO]->(neo4j)
CREATE (bddg)-[:TIENE_EJEMPLO]->(amazonNeptune)
CREATE (bddg)-[:TIENE_EJEMPLO]->(orientdb)
CREATE (bddg)-[:TIENE_EJEMPLO]->(arangodb)
CREATE (bddg)-[:TIENE_EJEMPLO]->(janusgraph)

// Crear nodos para Lenguajes de Consulta
CREATE (cypher:LenguajeConsulta {
    nombre: "Cypher",
    descripcion: "Lenguaje de consulta declarativo diseñado específicamente para trabajar con grafos en Neo4j."
})
CREATE (gremlin:LenguajeConsulta {
    nombre: "Gremlin",
    descripcion: "Parte de Apache TinkerPop, es un lenguaje de consulta de grafos orientado a traversals que permite navegar y manipular grafos."
})
CREATE (sparql:LenguajeConsulta {
    nombre: "SPARQL",
    descripcion: "Lenguaje de consulta para bases de datos RDF, utilizado principalmente en grafos de conocimiento y la web semántica."
})

// Crear relaciones desde BaseDeDatosDeGrafos a Lenguajes de Consulta
CREATE (bddg)-[:TIENE_LENGUAJE]->(cypher)
CREATE (bddg)-[:TIENE_LENGUAJE]->(gremlin)
CREATE (bddg)-[:TIENE_LENGUAJE]->(sparql)
