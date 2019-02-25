#!/bin/bash
echo [INFO]:  Table system_traces.sessions
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system_traces.sessions;
EOF
echo [INFO]: Table system.peers
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.peers;
EOF
echo [INFO]: Table system.schema_triggers
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.schema_triggers;
EOF
echo [INFO]: Table system.batchlog
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.batchlog;
EOF
echo [INFO]: Table system.local
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.local;
EOF
echo [INFO]: Table system.range_xrefers
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.range_xrefers;
EOF
echo [INFO]: Table system.sstable_activity
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.sstable_activity;
EOF
echo [INFO]: Table system.size_estimates
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.size_estimates;
EOF
echo [INFO]: Table system.hints
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.hints;
EOF
echo [INFO]: Table system.schema_keyspaces
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.schema_keyspaces;
EOF
echo [INFO]: Table system.peer_events
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.peer_events;
EOF
echo [INFO]: Table system.copaction_history
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.copaction_history;
EOF
echo [INFO]: Table system.schema_columns
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.schema_columns;
EOF
echo [INFO]: Table system.schema_usertypes
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.schema_usertypes;
EOF
echo [INFO]: Table system.compaction_in_progress
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.compaction_in_progress;
EOF
echo [INFO]: Table system."IndexInfo"
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system."IndexInfo";
EOF
echo [INFO]: Table system.paxos
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.paxos;
EOF
echo [INFO]: Table system.schema_columnfamilies
/usr/bin/cqlsh <<- EOF
    SELECT * FROM system.schema_columnfamilies;
EOF
