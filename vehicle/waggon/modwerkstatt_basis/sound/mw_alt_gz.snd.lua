local soundeffectsutil = require "::/scripts/soundsetutil.lua"

function data()
return {
	tracks = {
		{ name = "basis/mw_alt_gz/start.wav", refDist = 3.0 },
		{ name = "basis/mw_alt_gz/slow.wav", refDist = 3.0 },
		{ name = "basis/mw_alt_gz/normal.wav", refDist = 3.0 },
		{ name = "basis/mw_alt_gz/fast.wav", refDist = 3.0 },
		{ name = "basis/sfx/kurve_freight2.wav", refDist = 5.0 },
		{ name = "basis/sfx/bremse_mix.wav", refDist = 6.0 }
	},

	--bis

	updateFn = function (input)
		return {
			tracks = {
							{
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, { 0.05, 0.0 }, { 0.2, 5.0 }, { 0.3, 4.0 }, { 0.6, 1.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, { 0.25, 0.6 }, { 0.4, 2.5 }, { 0.6, 1.6 }, {1.0, 0.0}}, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, {0.2, 0.0}, { 0.4, 0.7 }, {0.6, 1.5}, { 0.8, 1.8 }, { 1.0, 0.5 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
								{
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, {0.8, 0.0}, { 0.9, 2.6 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				soundeffectsutil.squeal(input.speed, input.sideForce, 0.7),
				soundeffectsutil.brake(input.speed, input.brakeDecel, 2.5)
			},

		}
	end
}
end
