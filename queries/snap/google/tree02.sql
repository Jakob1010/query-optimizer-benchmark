select count(*) from google p1, google p2a, google p3a, google p3b, google p4a, google p4b
    
    WHERE p1.toNode = p2a.fromNode
        AND p2a.toNode = p3a.fromNode
            AND p3a.toNode = p4a.fromNode
            AND p3a.toNode = p4b.fromNode
        AND p2a.toNode = p3b.fromNode
            