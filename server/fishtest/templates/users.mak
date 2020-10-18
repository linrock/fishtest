<%inherit file="base.mak"/>
<h4> </h4>

<dl class="row">
  <dt class="col-2">Testers</dt>
  <dd class="col-2">${sum(u['last_updated'] != 'Never' for u in users)}</dd>

  <dt class="col-2">Active testers</dt>
  <dd class="col-2">${sum(u['games_per_hour'] > 0 for u in users)}</dd>

  <dt class="col-2">Games played</dt>
  <dd class="col-2">${sum(u['games'] for u in users)}</dd>
</dl>

<dl class="row">
  <dt class="col-2">Developers</dt>
  <dd class="col-2">${sum(u['tests'] > 0 for u in users)}</dd>

  <dt class="col-2">Tests submitted</dt>
  <dd class="col-2">${sum(u['tests'] for u in users)}</dd>

  <dt class="col-2">CPU time</dt>
  <dd class="col-2">${'%.2f years' % (sum(u['cpu_hours'] for u in users)/(24*365))}</dd>
</dl>

<table class="table table-striped table-sm">
 <thead>
  <tr>
   <th>Username</th>
   <th style="text-align:right">Last active</th>
   <th style="text-align:right">Games/Hour</th>
   <th style="text-align:right">CPU Hours</th>
   <th style="text-align:right">Games played</th>
   <th style="text-align:right">Tests submitted</th>
   <th>Tests repository</th>
  </tr>
 </thead>
 <tbody>
 %for user in users:
  <tr>
   <td>${user['username']}</td>
   <td style="text-align:right">${user['last_updated']}</td>
   <td style="text-align:right">${int(user['games_per_hour'])}</td>
   <td style="text-align:right">${int(user['cpu_hours'])}</td>
   <td style="text-align:right">${int(user['games'])}</td>
   <td style="text-align:right"><a href="/tests/user/${user['username']}">${user['tests']}</td>
   <td><a href="${user['tests_repo']}" target="_blank" rel="noopener">${user['tests_repo']}</a></td>
  </tr>
 %endfor
 </tbody>
</table>