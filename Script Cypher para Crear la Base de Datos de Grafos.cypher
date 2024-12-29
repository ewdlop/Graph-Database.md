// ---------------------------
// Creación de Índices y Restricciones
// ---------------------------

// Crear índice para la etiqueta Persona basado en la propiedad 'nombre'
CREATE INDEX persona_nombre_index FOR (p:Persona) ON (p.nombre);

// Crear índice para la etiqueta Empresa basado en la propiedad 'nombre'
CREATE INDEX empresa_nombre_index FOR (e:Empresa) ON (e.nombre);

// ---------------------------
// Creación de Nodos: Personas
// ---------------------------

CREATE (juan:Persona {nombre: "Juan", edad: 30, ubicación: "Madrid"})
CREATE (ana:Persona {nombre: "Ana", edad: 28, ubicación: "Barcelona"})
CREATE (luis:Persona {nombre: "Luis", edad: 35, ubicación: "Valencia"})
CREATE (maria:Persona {nombre: "María", edad: 32, ubicación: "Sevilla"})
CREATE (carlos:Persona {nombre: "Carlos", edad: 25, ubicación: "Bilbao"});

// ---------------------------
// Creación de Nodos: Empresas
// ---------------------------

CREATE (acme:Empresa {nombre: "Acme Corp", sector: "Tecnología", ubicación: "Madrid"})
CREATE (globex:Empresa {nombre: "Globex", sector: "Finanzas", ubicación: "Barcelona"})
CREATE (soylent:Empresa {nombre: "Soylent", sector: "Alimentación", ubicación: "Valencia"})
CREATE (initech:Empresa {nombre: "Initech", sector: "Software", ubicación: "Sevilla"});

// ---------------------------
// Creación de Relaciones: AMIGO_DE
// ---------------------------

// Juan es amigo de Ana
MATCH (p1:Persona {nombre: "Juan"}), (p2:Persona {nombre: "Ana"})
CREATE (p1)-[:AMIGO_DE {desde: 2015}]->(p2);

// Luis es amigo de María
MATCH (p1:Persona {nombre: "Luis"}), (p2:Persona {nombre: "María"})
CREATE (p1)-[:AMIGO_DE {desde: 2018}]->(p2);

// Carlos es amigo de Luis
MATCH (p1:Persona {nombre: "Carlos"}), (p2:Persona {nombre: "Luis"})
CREATE (p1)-[:AMIGO_DE {desde: 2020}]->(p2);

// Ana es amiga de María
MATCH (p1:Persona {nombre: "Ana"}), (p2:Persona {nombre: "María"})
CREATE (p1)-[:AMIGO_DE {desde: 2017}]->(p2);

// ---------------------------
// Creación de Relaciones: TRABAJA_EN
// ---------------------------

// Juan trabaja en Acme Corp
MATCH (p:Persona {nombre: "Juan"}), (e:Empresa {nombre: "Acme Corp"})
CREATE (p)-[:TRABAJA_EN {puesto: "Desarrollador", desde: 2016}]->(e);

// Ana trabaja en Globex
MATCH (p:Persona {nombre: "Ana"}), (e:Empresa {nombre: "Globex"})
CREATE (p)-[:TRABAJA_EN {puesto: "Analista Financiero", desde: 2019}]->(e);

// Luis trabaja en Soylent
MATCH (p:Persona {nombre: "Luis"}), (e:Empresa {nombre: "Soylent"})
CREATE (p)-[:TRABAJA_EN {puesto: "Gerente de Ventas", desde: 2014}]->(e);

// María trabaja en Initech
MATCH (p:Persona {nombre: "María"}), (e:Empresa {nombre: "Initech"})
CREATE (p)-[:TRABAJA_EN {puesto: "Ingeniera de Software", desde: 2021}]->(e);

// Carlos trabaja en Acme Corp
MATCH (p:Persona {nombre: "Carlos"}), (e:Empresa {nombre: "Acme Corp"})
CREATE (p)-[:TRABAJA_EN {puesto: "Diseñador UX", desde: 2022}]->(e);

// ---------------------------
// Consultas de Verificación (Opcional)
// ---------------------------

// Verificar todas las personas y sus amistades
MATCH (p:Persona)-[:AMIGO_DE]->(amigo)
RETURN p.nombre AS Persona, amigo.nombre AS Amigo, r.desde AS Desde;

// Verificar todas las personas y sus empleos
MATCH (p:Persona)-[r:TRABAJA_EN]->(e:Empresa)
RETURN p.nombre AS Persona, r.puesto AS Puesto, e.nombre AS Empresa, r.desde AS Desde;
